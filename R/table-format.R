# Shared table formatting for the HTML book and PDF lecture notes.
# Keep estimation, coefficient selection, custom SEs, and precision in the chapters.
model_table <- function(..., type = NULL, no.space = TRUE) {
  format <- if (knitr::is_latex_output()) "latex" else if (knitr::is_html_output()) "html" else "text"
  rendered <- capture.output(stargazer::stargazer(..., type=format,
    header=FALSE, float=FALSE, no.space=no.space, column.sep.width="4pt"))
  if (format == "html") {
    rendered <- c('<div class="course-table" role="region" aria-label="Statistical table" tabindex="0">',
                  rendered, '</div>')
  } else if (format == "latex") {
    rendered <- c('\\begin{center}\\small',
                  '\\setlength{\\tabcolsep}{4pt}\\renewcommand{\\arraystretch}{1.08}',
                  '\\begin{adjustbox}{max width=\\linewidth}', rendered,
                  '\\end{adjustbox}\\end{center}')
  } else {
    rendered <- c('```', rendered, '```')
  }
  knitr::asis_output(paste(rendered, collapse="\n"))
}

# booktabs rules, repeated PDF headers, and scrollable HTML for wide data tables.
data_table <- function(x, ..., long = FALSE, row_label = NULL) {
  if (!is.null(row_label)) {
    x <- data.frame(rownames(x), x, check.names=FALSE)
    names(x)[1] <- row_label
    rownames(x) <- NULL
  }
  table_align <- ifelse(vapply(as.data.frame(x),
    function(v) is.numeric(v) || is.complex(v), logical(1)), "r", "l")
  # Retain meaningful small p-values rather than rounding them to zero.
  pcols <- grep("Pr\\(|p[ ._-]?value", colnames(x), ignore.case=TRUE)
  if (length(pcols)) {
    x <- as.data.frame(x, check.names=FALSE)
    for (j in pcols) x[[j]] <- format.pval(x[[j]], digits=3, eps=.001)
  }
  args <- list(x=x, ...)
  if (is.null(args$align)) args$align <- table_align
  if (!is.null(row_label)) args$row.names <- FALSE
  latex <- knitr::is_latex_output()
  html <- knitr::is_html_output()
  if (latex) {
    args$format <- "latex"
    args$booktabs <- TRUE
    args$longtable <- long
    tab <- do.call(knitr::kable, args)
    tab <- kableExtra::kable_styling(tab, full_width=FALSE,
      font_size=if (long) 9.5 else 10,
      latex_options=if (long) "repeat_header" else c("scale_down", "HOLD_position"),
      repeat_header_method="replace", repeat_header_text="Continued from previous page")
    return(knitr::asis_output(paste0("\n", tab, "\n")))
  }
  if (html) args$format <- "html"
  tab <- do.call(knitr::kable, args)
  if (!html) return(tab)
  knitr::asis_output(paste0('\n<div class="course-table" role="region" ',
    'aria-label="Data table" tabindex="0">\n', tab, '\n</div>\n'))
}

# Preserve the dynamic-panel summary's estimates, instrument counts, and tests.
panel_table <- function(model) {
  s <- summary(model)
  tests <- list("Hansen J"=s$hansenj, "Slope Wald test"=s$slopef)
  if (is.list(s$time.dumf)) tests[["Time-dummy Wald test"]] <- s$time.dumf
  diagnostics <- do.call(rbind, lapply(names(tests), function(name) {
    test <- tests[[name]]
    data.frame(Test=name, Statistic=unname(test$statistic),
      df=paste(test$parameter, collapse=", "), p.value=test$p.value)
  }))
  counts <- data.frame(Component=names(s$data$n.inst),
                       Instruments=unname(s$data$n.inst))
  heading <- sprintf("Dynamic panel GMM (%s): %d step(s), %d instruments, %d parameters.",
    s$data$estimation, s$iter, sum(s$data$n.inst), nrow(s$coefficients))
  knitr::asis_output(paste(heading,
    data_table(s$coefficients, digits=3, row_label="Term"),
    data_table(counts, row.names=FALSE, digits=0),
    data_table(diagnostics, row.names=FALSE, digits=3), sep="\n\n"))
}
