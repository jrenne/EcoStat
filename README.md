# Econometrics and Statistics

Course notes by Jean-Paul Renne. Sources are in this bookdown project; generated HTML and PDF files are written to `docs/`.

## Reproduce the course

The tested environment uses R 4.5.1. `renv.lock` records the R packages, including the exact GitHub commit of `AEC`. Use an R session started in this folder:

```r
install.packages("renv")
renv::restore(lockfile = "renv.lock", library = "renv/library", prompt = FALSE)
```

The project library is local and ignored by Git. These instructions do not change the global R library or automatically load a saved workspace. HTML needs Pandoc; the build script discovers the standard macOS RStudio-bundled installation when necessary. PDF also needs XeLaTeX (for example via TinyTeX).

From a terminal, in this folder:

```sh
Rscript --vanilla scripts/build.R all
```

Use `html` or `pdf` instead of `all` to build one edition. EPUB remains an optional `epub` mode, but is not offered for download: its current converter reports unsupported mathematical notation and theorem references. The script checks package versions and the AEC commit before building. Keep `R/`, `scripts/`, `renv.lock`, the chapter files, styles, images, and bibliographies together. The script builds local files; it does not publish or push to GitHub.

`R/setup.R` loads the shared table formatting and gives each named R chunk a stable random seed. Explicit `set.seed()` calls in a chunk override that default. Chunk errors stop the build rather than being silently printed in the course. Do not rename chunks casually, since their labels also control figures, references, and simulation seeds.

## Historical GMM data

The GMM example originally used monthly observations from January 1990 to January 2022. Its ICE bond index now exposes only three years on FRED; current downloads cannot reproduce that historical window. See [FRED's series notes](https://fred.stlouisfed.org/series/BAMLCC0A4BBBTRIV).

An archived snapshot can be stored locally as `data-local/gmm-fred.csv`, or its path supplied through `GMM_DATA_FILE`. The columns, in order, must be:

```text
date,VIXCLS,PCE,SPASTT01USM661N,BAMLCC0A4BBBTRIV
```

Use one row per month, dates on the first day of the month, monthly-average levels, the complete stated window, and finite positive values. The loader rejects missing, duplicated, unordered, or incomplete observations. Store the archive's retrieval date and source alongside it. The book does not invent a replacement sample: without the file, the GMM section displays a clear data-availability note and retains its code without numerical execution.

`scripts/refresh-gmm-data.R` is an optional download tool for users with access to the required historical data. It reads `FRED_API_KEY` from the local environment, joins series by date, validates coverage, and only then replaces the local snapshot. It will fail if the original time window is unavailable. Never place credentials in source files. `.Renviron` and `data-local/` are ignored by Git; observe the data providers' terms when deciding what to distribute.

The previously embedded API key should be revoked or rotated by its owner. Removing it from current files does not invalidate it or remove it from prior Git commits and published copies. This refresh does not rewrite repository history.

## Verification and maintenance

Run `Rscript --vanilla scripts/check-maintenance.R` after restoring the environment. It checks the income-counterfactual calculation, isolation from chapter 4's credit transformations, and the snapshot validator.

Tables are formatted for both HTML and PDF through `R/table-format.R`; HTML code is collapsed by default. Build the complete book when checking cross-references: old chapter-only output may contain unresolved references even when the target exists in another chapter.

The repository is [jrenne/EcoStat](https://github.com/jrenne/EcoStat). The existing repository license declaration, [CC0](https://creativecommons.org/publicdomain/zero/1.0/), is retained; third-party datasets have their own source terms.

## Basic Statistical Results pilot

The first chapter now includes seven end-of-chapter exercises adapted from the
Spring 2026 Overleaf exercise collection. Student statements and metadata live in
`exercises/basics/`, one Markdown file per exercise. These are the maintained
textbook versions; the original Overleaf collection is unchanged. Each exercise
has a stable ID, descriptive title, level, type, and link to its prerequisite
section. `R/exercises.R` produces the end-of-chapter exercise section
from those files. Do not edit generated HTML or TeX to change an exercise.

**Student edition: no solutions or exercise-specific hints.** These are not hidden
in HTML: they are excluded from the textbook sources and builds. The instructor
companion lives outside this Git repository, in the sibling course folder
`../Instructor_materials/Basic_Statistical_Results/`. Keep it out of public hosting.
Its build script reads student statements from this bank and instructor answers
from that separate folder, then exports a private PDF and editable TeX.

Build an isolated student preview without rebuilding or replacing `docs/`:

```sh
Rscript --vanilla scripts/build-basics-pilot.R
```

This uses the available R installation with `bookdown`, `rmarkdown`, `knitr`, and
Pandoc, plus XeLaTeX for PDF. It does not enforce the complete book's lockfile
because it executes only the pilot chapter. Outputs are in `preview/basics/`
(ignored by Git). The preview includes reference blocks drawn directly from the
other chapters so its internal references resolve. The full book continues to
use its original appendix and build workflow. This is a pilot, not a migration
of the other 34 main exercises or the two supplementary exercises.

The pilot corrects the joint-density integration order and aligns the Cauchy
simulation with the location parameter stated in its text. The instructor
companion records exercise-specific editorial corrections.

The pilot PDF uses `pdf-modern.tex`: Arial text (with TeX Gyre Heros as a
fallback), 11-point type, restrained blue headings, and simple running headers.
Mathematical fonts remain unchanged. This style is also used by the instructor
companion; the full-book PDF style has not yet been switched. The exercise index
has been removed in favor of the end-of-chapter exercise section.
