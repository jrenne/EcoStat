# Run with Rscript --vanilla scripts/build.R [all|html|pdf|epub] from the project root.
local_library <- file.path(getwd(), "renv", "library")
if (dir.exists(local_library)) .libPaths(c(local_library, .libPaths()))
if (!file.exists("renv.lock")) stop("Run from the book's root directory.")
root <- normalizePath(getwd())
source("R/exercises.R")
source("R/instructor-build.R")
show_solutions <- edition_setting()
lock <- jsonlite::read_json("renv.lock")
problems <- vapply(names(lock$Packages), function(p) {
  if (!requireNamespace(p, quietly=TRUE)) return(paste(p, "is missing"))
  wanted <- lock$Packages[[p]]$Version
  actual <- as.character(utils::packageVersion(p))
  if (utils::packageVersion(p) != package_version(wanted)) paste(p, "is", actual, "but the lockfile requires", wanted) else ""
}, character(1))
if (any(nzchar(problems))) stop(paste(c("Restore the recorded environment first (see README):", problems[nzchar(problems)]),collapse="\n"))
aec_sha <- utils::packageDescription("AEC")$RemoteSha
if (!identical(aec_sha, lock$Packages$AEC$RemoteSha)) stop("The installed AEC commit differs from renv.lock.")
# RStudio bundles Pandoc, but command-line R on macOS may not discover it.
if (!rmarkdown::pandoc_available() && Sys.info()[["sysname"]] == "Darwin") {
  arch <- if (grepl("arm|aarch", Sys.info()[["machine"]])) "aarch64" else "x86_64"
  candidate <- file.path("/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools", arch)
  if (file.exists(file.path(candidate, "pandoc"))) Sys.setenv(RSTUDIO_PANDOC=candidate)
  rmarkdown::find_pandoc(cache=FALSE)
}
if (!rmarkdown::pandoc_available()) stop("Pandoc is required; install RStudio or add Pandoc to PATH.")
mode <- commandArgs(trailingOnly=TRUE)
if (!length(mode)) mode <- "all"
formats <- c(html="bookdown::gitbook",pdf="bookdown::pdf_book",epub="bookdown::epub_book")
if (length(mode)!=1L || !mode %in% c("all",names(formats))) stop("Choose all, html, pdf, or epub.")
if (mode == "all") formats <- formats[c("html", "pdf")] else formats <- formats[mode]
# Render instructor books entirely outside the repository, including intermediates.
if (show_solutions) {
  stage <- private_build_stage(root)
  paths <- list.files(root,full.names=TRUE)
  paths <- paths[!basename(paths) %in% c("docs","preview","renv","_bookdown_files")]
  for (path in paths) if (!file.copy(path,stage,recursive=TRUE)) stop("Cannot stage: ",path)
  setwd(stage)
  destination <- file.path(instructor_directory(root),"Textbook")
  for (format in formats) bookdown::render_book("index.Rmd",output_format=format,output_dir=destination,clean=TRUE)
  setwd(root)
  unlink(stage,recursive=TRUE)
  cat("Private instructor edition: ",destination,"\n",sep="")
} else {
  for (format in formats) bookdown::render_book("index.Rmd",output_format=format)
}
