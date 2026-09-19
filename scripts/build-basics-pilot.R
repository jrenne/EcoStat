# From the book root: Rscript --vanilla scripts/build-basics-pilot.R
# Builds an isolated student preview, never overwriting the complete book in docs/.
root <- normalizePath(getwd())
if (!file.exists("01-Basics.Rmd")) stop("Run from EcoStat_bookdown.")
if (!rmarkdown::pandoc_available() && Sys.info()[["sysname"]] == "Darwin") {
  candidate <- "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/aarch64"
  if (file.exists(file.path(candidate, "pandoc"))) Sys.setenv(RSTUDIO_PANDOC=candidate)
  rmarkdown::find_pandoc(cache=FALSE)
}
if (!rmarkdown::pandoc_available()) stop("Pandoc is required.")
source("R/exercises.R")
source("R/instructor-build.R")
show_solutions <- edition_setting()
stage <- if (show_solutions) private_build_stage(root) else tempfile("basics-pilot-")
if (!dir.exists(stage)) dir.create(stage)
for (path in c("R", "exercises", "images", "style.css", "preamble.tex", "pdf-modern.tex", "pdf-boxes.tex",
               "01-Basics.Rmd")) {
  if (!file.copy(file.path(root,path), stage, recursive=TRUE)) stop("Cannot copy ", path)
}
# The standalone preview has reference notes in place of the full appendix.
chapter <- readLines(file.path(stage,"01-Basics.Rmd"), warn=FALSE)
chapter <- gsub("Appendix \\@ref(StochConvergences)", "The reference notes", chapter, fixed=TRUE)
writeLines(chapter, file.path(stage,"01-Basics.Rmd"))
writeLines(c('---', 'title: "Econometrics and Statistics"',
             paste0('subtitle: "Basic Statistical Results: ', if (show_solutions) 'instructor pilot - private' else 'student pilot', '"'),
             'params:', paste0('  show_solutions: ',tolower(show_solutions)),
             'author: "Jean-Paul Renne"', 'documentclass: book', 'fontsize: 11pt', 'classoption: oneside',
             '---', '', '```{r pilot-setup, include=FALSE}',
             'source("R/instructor-build.R")', 'configure_edition(params$show_solutions)',
             'source("R/setup.R")', '```', '', '\\newcommand{\\bv}[1]{\\mathbf{#1}}', '',
             '# About this pilot {-}', '',
             if (show_solutions) 'Private instructor edition: includes hints and solutions after each exercise.' else 'This preview combines the opening textbook chapter with seven end-of-chapter exercises. Solutions and exercise-specific hints are reserved for teaching sessions.', '',
             'The reference notes reproduce the definitions and theorem from elsewhere in the textbook that this chapter cites.'),
           file.path(stage,"index.Rmd"))
# Reuse exact source blocks instead of maintaining duplicate mathematical definitions.
extract_block <- function(path, id) {
  lines <- readLines(path, warn=FALSE)
  start <- which(grepl(paste0("#",id,"[ }]") , lines) & grepl("^:::", lines))
  if (length(start)!=1L) stop("Expected one definition/theorem: ", id)
  end <- which(seq_along(lines)>start & grepl("^:::\\s*$", lines))[1]
  lines[start:end]
}
refs <- c('# Reference notes {#pilot-reference-notes .unnumbered}', '',
          '## Stochastic convergences {#StochConvergences .unnumbered}', '')
for (id in c("convergenceproba", "convergenceLr", "cvgceDistri", "Cauchy")) {
  refs <- c(refs, extract_block("09-Appendix.Rmd",id), '')
}
refs <- c(refs, extract_block("02-CLT.Rmd","LLN"))
writeLines(refs,file.path(stage,"08-ReferenceNotes.Rmd"))
writeLines(c('book_filename: "Basic-Statistical-Results"', 'output_dir: "output"',
             'delete_merged_file: true', 'rmd_files:', '  - index.Rmd',
             '  - 01-Basics.Rmd', '  - 08-ReferenceNotes.Rmd'),
           file.path(stage,"_bookdown.yml"))
writeLines(c('bookdown::gitbook:', '  css: style.css', '  code_folding: hide',
             '  config:', '    download: ["pdf"]',
             'bookdown::pdf_book:', '  latex_engine: xelatex',
             '  keep_tex: true', '  includes:', '    in_header: [preamble.tex, pdf-modern.tex]'),
           file.path(stage,"_output.yml"))
setwd(stage)
for (format in c("bookdown::gitbook", "bookdown::pdf_book")) {
  bookdown::render_book("index.Rmd", output_format=format, clean=TRUE)
}
setwd(root)
destination <- if (show_solutions) file.path(instructor_directory(root),"Textbook-pilot") else file.path(root,"preview","basics")
dir.create(destination, recursive=TRUE, showWarnings=FALSE)
# Remove the retired generated index page from earlier pilot builds.
unlink(file.path(destination,"exercise-index.html"))
# This directory is dedicated to the pilot and contains no complete-book output.
for (path in list.files(file.path(stage,"output"), full.names=TRUE, all.files=TRUE, no..=TRUE)) {
  if (!file.copy(path,destination,recursive=TRUE,overwrite=TRUE)) stop("Cannot copy output: ", path)
}
cat(if (show_solutions) "Private instructor preview: " else "Student preview: ", file.path(destination,"index.html"), "\n", sep="")
cat("Staging directory: ", stage, "\n", sep="")
