# Private answer loading and edition routing; contains no answer text.
instructor_directory <- function(book_root) {
  book_root <- normalizePath(book_root, mustWork=TRUE)
  path <- Sys.getenv("ECOSTAT_INSTRUCTOR_DIR", unset=file.path(
    dirname(book_root), "Instructor_materials", "Basic_Statistical_Results"))
  if (!dir.exists(path)) return(NULL)
  path <- normalizePath(path, mustWork=TRUE)
  if (identical(path,book_root) || startsWith(path,paste0(book_root,"/"))) {
    stop("Instructor material must be outside the textbook repository.")
  }
  path
}

instructor_records <- function(private_dir) {
  paths <- list.files(private_dir, pattern="^[0-9].*\\.md$", full.names=TRUE)
  records <- lapply(paths, function(path) {
    meta <- rmarkdown::yaml_front_matter(path)
    text <- readLines(path, warn=FALSE)
    hint <- which(text=="## Hint"); solution <- which(text=="## Solution")
    if (is.null(meta$id) || length(hint)!=1 || length(solution)!=1 || hint>=solution || solution>=length(text) ||
        !nzchar(trimws(paste(text[seq.int(solution+1,length(text))],collapse="\n")))) {
      stop("Incomplete instructor record: ", basename(path))
    }
    list(id=meta$id, content=text[seq.int(hint,length(text))])
  })
  ids <- vapply(records, `[[`, character(1), "id")
  if (anyDuplicated(ids)) stop("Duplicate instructor exercise IDs.")
  setNames(records,ids)
}

edition_setting <- function(path="index.Rmd") {
  value <- rmarkdown::yaml_front_matter(path)$params$show_solutions
  if (!is.logical(value) || length(value)!=1L || is.na(value))
    stop("Set params: show_solutions to true or false in index.Rmd.")
  value
}

configure_edition <- function(show_solutions) {
  options(ecostat.show_solutions=isTRUE(show_solutions))
  if (!isTRUE(show_solutions)) return(invisible(NULL))
  root <- Sys.getenv("ECOSTAT_BOOK_ROOT", unset=getwd())
  private <- instructor_directory(root)
  if (is.null(private)) stop("Private solution files are unavailable.")
  here <- normalizePath(getwd())
  if (!startsWith(here,paste0(private,"/")))
    stop("For the instructor edition, use scripts/build.R or scripts/build-basics-pilot.R so all output stays private.")
  options(ecostat.instructor_dir=private)
}

private_build_stage <- function(root) {
  private <- instructor_directory(root)
  if (is.null(private)) stop("Private solution files are unavailable.")
  stage <- tempfile(".build-",tmpdir=private)
  dir.create(stage)
  Sys.setenv(ECOSTAT_BOOK_ROOT=root)
  stage
}
