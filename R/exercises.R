# Shared exercise renderer. Private answers are loaded only for the instructor edition.
read_exercises <- function(topic, root=".") {
  paths <- sort(list.files(file.path(root, "exercises", topic), pattern="\\.md$", full.names=TRUE))
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
  answers <- NULL
  if (isTRUE(getOption("ecostat.show_solutions", FALSE))) {
    answers <- instructor_records(getOption("ecostat.instructor_dir"))
    ids <- vapply(entries, `[[`, character(1), "id")
    if (any(!ids %in% names(answers))) stop("Missing private solutions: ", paste(setdiff(ids,names(answers)),collapse=", "))
  }
  output <- vapply(entries, function(x) paste0(
    if (knitr::is_latex_output()) "\\Needspace{28\\baselineskip}\n\n" else "",
    ":::: {.exercisebox data-latex=\"\"}\n\n",
    "::: {.exercise #", x$id, " name=\"", x$title, "\"}\n\n",
    "**", x$difficulty, " | ", x$type, "**  \n",
    "Review Section \\@ref(", x$related, ").\n\n", x$statement, "\n\n:::\n\n::::\n",
    if (!is.null(answers)) paste0("\n",paste(sub("^## (Hint|Solution)$", "**\\1**",answers[[x$id]]$content),collapse="\n"),"\n") else ""), character(1))
  knitr::asis_output(paste(output, collapse="\n"))
}
