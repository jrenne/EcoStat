source("R/table-format.R")
# Every named chunk starts from a stable seed; explicit set.seed() calls still win.
knitr::opts_hooks$set(course_seed = function(options) {
  if (isTRUE(options$course_seed)) {
    chars <- utf8ToInt(options$label)
    set.seed(1000L + sum(chars * seq_along(chars)))
  }
  options
})
knitr::opts_chunk$set(course_seed=TRUE, error=FALSE)
