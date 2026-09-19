# A monthly teaching snapshot; never silently substitute a different time window.
read_gmm_data <- function(path, start="1990-01-01", end="2022-01-01") {
  x <- read.csv(path, check.names=FALSE)
  required <- c("date", "VIXCLS", "PCE", "SPASTT01USM661N", "BAMLCC0A4BBBTRIV")
  if (!identical(names(x), required)) stop("GMM snapshot columns must be: ", paste(required, collapse=", "))
  x$date <- as.Date(x$date)
  expected <- seq(as.Date(start), as.Date(end), by="month")
  if (!identical(x$date, expected)) stop("GMM snapshot must contain every month from ", start, " to ", end, " in order.")
  values <- as.matrix(x[-1])
  if (!is.numeric(values) || any(!is.finite(values)) || any(values <= 0)) {
    stop("GMM series must have finite, positive values in every month.")
  }
  x
}
