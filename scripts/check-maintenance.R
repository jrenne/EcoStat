if (dir.exists("renv/library")) .libPaths(c(normalizePath("renv/library"), .libPaths()))
source("R/companion-packages.R")
use_companion_packages()
source("R/gmm-data.R")
# Check transformed predictors against an independent formula specification.
d <- transform(AEC::UCIcredit, default=default_next_month,
               log_limit=log(LIMIT_BAL/100000), age10=(AGE-40)/10,
               delay=as.integer(PAY_0>=1))
m <- glm(default ~ log_limit + age10 + delay, data=d, family=binomial())
counterfactual <- transform(d, LIMIT_BAL=1.1*LIMIT_BAL,
                           log_limit=log_limit+log(1.1))
m_formula <- glm(default ~ log(LIMIT_BAL/100000) + I((AGE-40)/10) +
                   I(as.integer(PAY_0>=1)), data=d, family=binomial())
p1 <- predict(m, newdata=counterfactual, type="response")
p2 <- predict(m_formula, newdata=counterfactual, type="response")
stopifnot(isTRUE(all.equal(unname(p1),unname(p2))))
stopifnot(identical(d$LIMIT_BAL, AEC::UCIcredit$LIMIT_BAL))
# Synthetic values below test input validation only; they are not teaching data.
test <- data.frame(date=seq(as.Date("1990-01-01"),as.Date("2022-01-01"),by="month"))
for (id in c("VIXCLS","PCE","SPASTT01USM661N","BAMLCC0A4BBBTRIV")) test[[id]] <- seq_len(nrow(test))+1
path <- tempfile(fileext=".csv")
write.csv(test,path,row.names=FALSE)
stopifnot(nrow(read_gmm_data(path))==385L)
write.csv(test[-1,],path,row.names=FALSE)
stopifnot(inherits(try(read_gmm_data(path),silent=TRUE),"try-error"))
unlink(path)
cat("PASS: UCI credit-limit comparison, unchanged package data, and archived snapshot validation.\n")
cat("Average probability change:",mean(p1-predict(m,newdata=d,type="response")),"\n")
