# Student-only exercise renderer. Hints and answers live outside this repository.
read_exercises <- function(topic) {
  paths <- sort(list.files(file.path("exercises", topic), pattern="\\.md$", full.names=TRUE))
  if (!length(paths)) stop("No exercises found for topic: ", topic)
  entries <- lapply(paths, function(path) {
    meta <- rmarkdown::yaml_front_matter(path)
    lines <- readLines(path, warn=FALSE)
    start <- which(lines == "## Statement")
    if (length(start) != 1L) stop("Expected one Statement section in ", path)
    if (any(grepl("^## (Hint|Solution)", lines))) stop("Instructor content in student exercise: ", path)
    required <- c("id", "title", "difficulty", "type", "related")
    if (!all(required %in% names(meta))) stop("Missing exercise metadata in ", path)
    meta$statement <- paste(lines[seq.int(start+1L, length(lines))], collapse="\n")
    meta
  })
  ids <- vapply(entries, `[[`, character(1), "id")
  if (anyDuplicated(ids)) stop("Duplicate exercise IDs")
  entries
}

render_exercises <- function(topic) {
  entries <- read_exercises(topic)
  output <- vapply(entries, function(x) paste0(
    if (knitr::is_latex_output()) "\\Needspace{28\\baselineskip}\n\n" else "",
    "::: {.exercise #", x$id, " name=\"", x$title, "\"}\n\n",
    "**", x$difficulty, " | ", x$type, "**  \n",
    "Review Section \\@ref(", x$related, ").\n\n", x$statement, "\n\n:::\n"), character(1))
  knitr::asis_output(paste(output, collapse="\n"))
}
