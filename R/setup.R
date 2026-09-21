source("R/table-format.R")

# Apply the PDF code-display switch after chunk-specific options have been
# combined with the global options. This makes the switch authoritative even
# for chunks that explicitly use echo=TRUE, without changing the HTML edition.
configure_code_display <- function(show_code_in_pdf) {
  if (!is.logical(show_code_in_pdf) || length(show_code_in_pdf) != 1L || is.na(show_code_in_pdf)) {
    stop("Set params: show_code_in_pdf to true or false in index.Rmd.")
  }
  hide_pdf_code <- knitr::is_latex_output() && !isTRUE(show_code_in_pdf)
  knitr::opts_hooks$set(ecostat_hide_pdf_code = function(options) {
    if (isTRUE(options$ecostat_hide_pdf_code)) options$echo <- FALSE
    options
  })
  knitr::opts_chunk$set(ecostat_hide_pdf_code=hide_pdf_code)
  invisible(NULL)
}

# Every named chunk starts from a stable seed; explicit set.seed() calls still win.
knitr::opts_hooks$set(course_seed = function(options) {
  if (isTRUE(options$course_seed)) {
    chars <- utf8ToInt(options$label)
    set.seed(1000L + sum(chars * seq_along(chars)))
  }
  options
})
knitr::opts_chunk$set(course_seed=TRUE, error=FALSE)
