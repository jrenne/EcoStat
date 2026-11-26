# Frozen companion packages are installed in this book's private library.
use_companion_packages <- function(root = getwd()) {
  root <- normalizePath(root, mustWork = TRUE)
  standard_library <- file.path(root, "renv", "library")
  if (dir.exists(standard_library)) .libPaths(c(standard_library, .libPaths()))
  if (!requireNamespace("digest", quietly = TRUE)) {
    stop("Restore the course environment first: Rscript --vanilla scripts/setup.R")
  }
  manifest <- utils::read.delim(file.path(root, "packages", "manifest.tsv"),
                              stringsAsFactors = FALSE, check.names = FALSE)
  library <- file.path(root, ".course-library", paste0("R-", getRversion()),
                       R.version$platform)
  dir.create(library, recursive = TRUE, showWarnings = FALSE)
  library <- normalizePath(library)
  .libPaths(c(library, .libPaths()))
  for (i in seq_len(nrow(manifest))) {
    record <- manifest[i, ]
    archive <- file.path(root, "packages", record$file)
    if (!file.exists(archive) ||
        !identical(digest::digest(file = archive, algo = "sha256"), record$sha256)) {
      stop("Missing or modified companion archive: ", record$file)
    }
    marker <- file.path(library, paste0(".", record$package, "-source-sha256"))
    current <- tryCatch(suppressWarnings(utils::packageDescription(record$package, lib.loc = library)),
                        error = function(e) NULL)
    ready <- is.list(current) && identical(current$Version, record$version) &&
      file.exists(marker) && identical(readLines(marker, warn = FALSE), record$sha256)
    if (!ready) {
      if (record$package %in% loadedNamespaces()) {
        stop("Restart R before updating the companion package ", record$package)
      }
      utils::install.packages(archive, repos = NULL, type = "source", lib = library,
                              quiet = TRUE)
      installed <- utils::packageDescription(record$package, lib.loc = library)
      if (!identical(installed$Version, record$version)) stop("Package installation failed")
      writeLines(record$sha256, marker)
    }
    if (record$package %in% loadedNamespaces()) {
      loaded <- normalizePath(getNamespaceInfo(asNamespace(record$package), "path"))
      if (!identical(loaded, normalizePath(file.path(library, record$package)))) {
        stop("Restart R: an unrelated version of ", record$package, " is already loaded")
      }
    }
  }
  invisible(manifest)
}

check_course_environment <- function(root = getwd()) {
  lock <- jsonlite::read_json(file.path(root, "renv.lock"))
  problems <- vapply(names(lock$Packages), function(p) {
    available <- tryCatch(as.character(utils::packageVersion(p)), error = function(e) NA_character_)
    if (is.na(available)) return(paste(p, "is missing"))
    wanted <- lock$Packages[[p]]$Version
    if (package_version(available) != package_version(wanted)) paste(p, "is", available, "but requires", wanted) else ""
  }, character(1))
  if (any(nzchar(problems))) {
    stop(paste(c("Restore the course environment: Rscript --vanilla scripts/setup.R",
                 problems[nzchar(problems)]), collapse = "\n"))
  }
  invisible(TRUE)
}

render_course_format <- function(format, output_dir = NULL) {
  # Each format starts in a fresh R process; no processx/callr background service.
  script <- tempfile(fileext = ".R")
  on.exit(unlink(script), add = TRUE)
  writeLines(c(
    "options(warn=1)",
    ".libPaths(strsplit(Sys.getenv('COURSE_BUILD_LIBRARIES'), .Platform$path.sep, fixed=TRUE)[[1]])",
    "args <- commandArgs(trailingOnly=TRUE)",
    "if (length(args)>1L) bookdown::render_book('index.Rmd', output_format=args[1], output_dir=args[2], clean=TRUE) else bookdown::render_book('index.Rmd', output_format=args[1], clean=TRUE)"
  ), script)
  previous <- Sys.getenv("COURSE_BUILD_LIBRARIES", unset = NA_character_)
  on.exit(if (is.na(previous)) Sys.unsetenv("COURSE_BUILD_LIBRARIES") else
    Sys.setenv(COURSE_BUILD_LIBRARIES = previous), add = TRUE)
  Sys.setenv(COURSE_BUILD_LIBRARIES = paste(.libPaths(), collapse = .Platform$path.sep))
  args <- c(shQuote(script), shQuote(unname(format)))
  if (!is.null(output_dir)) args <- c(args, shQuote(output_dir))
  status <- system2(file.path(R.home("bin"), "Rscript"), c("--vanilla", args))
  if (status != 0L) stop("Course build failed for ", format)
  invisible(NULL)
}
