# Outcome-free feature construction for the chapter's default-score application.
# All feature screening is based on the specified training clients only.
credit_shrink_design <- function(d,train,specification=c('quadratic','status-interactions','cubic')) {
 specification <- match.arg(specification)
 num <- data.frame(log_limit=log(d$LIMIT_BAL/100000),age10=(d$AGE-40)/10)
 for(j in 1:6){
  b <- d[[paste0('BILL_AMT',j)]]
  num[[paste0('balance',j)]] <- sign(b)*log1p(abs(b)/10000)
  num[[paste0('payment',j)]] <- log1p(d[[paste0('PAY_AMT',j)]]/10000)
 }
 categories <- d[,c('SEX','EDUCATION','MARRIAGE','PAY_0',paste0('PAY_',2:6))]
 categories[] <- lapply(categories,factor)
 base <- model.matrix(~.,data=cbind(num,categories))[,-1,drop=FALSE]
 squares <- as.matrix(num)^2;colnames(squares) <- paste0(names(num),'_squared')
 pairs <- combn(names(num),2,simplify=FALSE)
 interactions <- vapply(pairs,function(z)num[[z[1]]]*num[[z[2]]],numeric(nrow(d)))
 colnames(interactions) <- vapply(pairs,paste,collapse=':',character(1))
 x <- cbind(base,squares,interactions)
 if(specification=='status-interactions'){
  status <- model.matrix(~.,data=categories[,4:9,drop=FALSE])[,-1,drop=FALSE]
  # Avoid estimating interactions for exceptionally rare status categories.
  status <- status[,colSums(status[train,,drop=FALSE])>=200,drop=FALSE]
  extra <- do.call(cbind,lapply(seq_len(ncol(status)),function(j){
   z <- as.matrix(num)*status[,j]
   colnames(z) <- paste(colnames(num),colnames(status)[j],sep=':');z
  }))
  x <- cbind(x,extra)
 }
 if(specification=='cubic'){
  triples <- list();k <- 0L
  for(i in seq_len(ncol(num))) for(j in i:ncol(num)) for(l in j:ncol(num)){
   k <- k+1L;triples[[k]] <- c(i,j,l)
  }
  extra <- vapply(triples,function(t)num[[t[1]]]*num[[t[2]]]*num[[t[3]]],numeric(nrow(d)))
  colnames(extra) <- vapply(triples,function(t)paste(names(num)[t],collapse=':'),character(1))
  x <- cbind(x,extra)
 }
 keep <- apply(x[train,,drop=FALSE],2,function(v)length(unique(v))>1)
 x <- x[,keep,drop=FALSE]
 q <- qr(cbind(Intercept=1,x[train,]),tol=1e-8)
 independent <- sort(q$pivot[seq_len(q$rank)])
 x[,independent[independent>1]-1,drop=FALSE]
}
