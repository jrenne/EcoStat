source('R/companion-packages.R')
manifest <- use_companion_packages()
check_course_environment()
if ('AEC' %in% manifest$package) {
  stopifnot(nrow(data(package='AEC')$results)==14L,
            nrow(AEC::UCIcredit)==30000L,
            !any(c('shp','randdata','smi','airbnb','credit') %in%
                 data(package='AEC')$results[,'Item']))
}
if ('IdSS' %in% manifest$package) {
  stopifnot('x_lags' %in% names(formals(IdSS::estim.armax)),
            nrow(data(package='IdSS')$results)==12L)
}
# A wrong or edited archive must fail before installation or data evaluation.
fixture <- tempfile('companion-integrity-');dir.create(fixture)
file.copy('packages',fixture,recursive=TRUE)
archive <- file.path(fixture,'packages',manifest$file[1])
cat('invalid',file=archive,append=TRUE)
message <- tryCatch({use_companion_packages(fixture);''},error=function(e)conditionMessage(e))
stopifnot(grepl('Missing or modified companion archive',message,fixed=TRUE))
unlink(fixture,recursive=TRUE)
cat('PASS: companion version, data/API inventory and archive-integrity rejection.\n')
