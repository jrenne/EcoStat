# Run from the book root. Compares three pre-specified bases on training clients
# only. It never evaluates or selects a basis using the 9,000 reserved outcomes.
.libPaths(c('renv/library',.libPaths()))
library(glmnet)
source('R/credit-shrinkage-design.R')
if(file.exists('../AEC/data/UCIcredit.rda')) load('../AEC/data/UCIcredit.rda') else data('UCIcredit',package='AEC')
set.seed(17828) # Same fixed client split/folds as credit-shrink-data.
train <- sort(sample.int(nrow(UCIcredit),21000))
folds <- sample(rep(1:5,length.out=length(train)))
y <- UCIcredit$default_next_month[train]
lambda <- exp(seq(log(10),log(.0001),length.out=80))
results <- lapply(c('quadratic','status-interactions','cubic'),function(spec){
 x <- credit_shrink_design(UCIcredit,train,spec)
 cv0 <- cv.glmnet(x[train,],y,alpha=0,lambda=lambda,foldid=folds)
 cv1 <- cv.glmnet(x[train,],y,alpha=1,lambda=lambda,foldid=folds)
 errors <- vapply(1:5,function(f){
  tr <- which(folds!=f);va <- which(folds==f)
  fit <- lm.fit(cbind(1,x[train[tr],]),y[tr],tol=1e-8)
  b <- fit$coefficients;b[is.na(b)] <- 0
  mean((as.numeric(cbind(1,x[train[va],])%*%b)-y[va])^2)
 },numeric(1))
 data.frame(Specification=spec,p=ncol(x),OLS_CV=mean(errors),
 Ridge_CV=min(cv0$cvm),Lasso_CV=min(cv1$cvm),
 Ridge_lambda=cv0$lambda.min,Lasso_lambda=cv1$lambda.min)
})
report <- do.call(rbind,results)
write.csv(report,'scripts/validation/credit-shrinkage-specifications.csv',row.names=FALSE)
print(report)
