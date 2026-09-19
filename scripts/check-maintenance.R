if (dir.exists("renv/library")) .libPaths(c(normalizePath("renv/library"), .libPaths()))
source("R/gmm-data.R")
d <- AEC::credit
d$Default <- as.integer(d$loan_status %in% c("Charged Off", "Does not meet the credit policy. Status:Charged Off"))
d$amt2income <- d$loan_amnt/d$annual_inc
m <- glm(Default ~ grade + log(loan_amnt) + amt2income + delinq_2yrs + log(annual_inc) + I(log(annual_inc)^2),
         data=d, family=binomial(link="probit"))
counterfactual <- d
counterfactual$annual_inc <- 1.01*d$annual_inc
counterfactual$amt2income <- counterfactual$loan_amnt/counterfactual$annual_inc
stopifnot(isTRUE(all.equal(counterfactual$amt2income, d$amt2income/1.01)))
# Independent specification recomputes the ratio inside the prediction formula.
m_formula <- glm(Default ~ grade + log(loan_amnt) + I(loan_amnt/annual_inc) + delinq_2yrs + log(annual_inc) + I(log(annual_inc)^2),
                 data=d, family=binomial(link="probit"))
p1 <- predict(m, newdata=counterfactual, type="response")
p2 <- predict(m_formula, newdata=counterfactual, type="response")
stopifnot(isTRUE(all.equal(unname(p1),unname(p2))))
# Mutating the shrinkage copy must not change the package data or binary-choice copy.
credit_lasso <- AEC::credit
credit_lasso$verification_status <- 0
stopifnot(identical(d$verification_status, AEC::credit$verification_status))
# Synthetic values below test input validation only; they are not teaching data.
test <- data.frame(date=seq(as.Date("1990-01-01"),as.Date("2022-01-01"),by="month"))
for (id in c("VIXCLS","PCE","SPASTT01USM661N","BAMLCC0A4BBBTRIV")) test[[id]] <- seq_len(nrow(test))+1
path <- tempfile(fileext=".csv")
write.csv(test,path,row.names=FALSE)
stopifnot(nrow(read_gmm_data(path))==385L)
write.csv(test[-1,],path,row.names=FALSE)
stopifnot(inherits(try(read_gmm_data(path),silent=TRUE),"try-error"))
unlink(path)
cat("PASS: consistent counterfactual, independent credit copies, and snapshot validation.\n")
cat("Average probability change:",mean(p1-predict(m,newdata=d,type="response")),"\n")
