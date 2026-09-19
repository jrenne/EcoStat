# Run from the project root. Set FRED_API_KEY outside the source code.
# Requires access to the historical ICE series; its public FRED history is now limited.
source("R/gmm-data.R")
key <- Sys.getenv("FRED_API_KEY")
if (!nzchar(key)) stop("Set FRED_API_KEY in your local environment first.")
fredr::fredr_set_key(key)
ids <- c("VIXCLS", "PCE", "SPASTT01USM661N", "BAMLCC0A4BBBTRIV")
series <- lapply(ids, function(id) {
  x <- fredr::fredr(series_id=id, observation_start=as.Date("1990-01-01"),
    observation_end=as.Date("2022-01-01"), frequency="m", aggregation_method="avg")
  result <- data.frame(date=x$date, value=x$value)
  names(result)[2] <- id
  result
})
x <- Reduce(function(a,b) merge(a,b,by="date",all=TRUE), series)
# Validate before replacing any existing snapshot.
staged <- tempfile(fileext=".csv")
write.csv(x, staged, row.names=FALSE)
read_gmm_data(staged)
dir.create("data-local", showWarnings=FALSE)
file.copy(staged, "data-local/gmm-fred.csv", overwrite=TRUE)
writeLines(c(paste("Retrieved:", Sys.Date()), "Source: FRED; monthly averages.",
  paste("Series:", paste(ids, collapse=", ")),
  "Window: 1990-01-01 to 2022-01-01. Respect original data-provider terms."),
  "data-local/gmm-fred-provenance.txt")
