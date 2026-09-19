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

With `show_solutions: false`, answers and hints are absent from the generated
HTML and PDF. Private answer sources stay outside this repository in
`../Instructor_materials/Basic_Statistical_Results/`.

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

The textbook PDF uses `pdf-modern.tex`: Arial text (with TeX Gyre Heros as a
fallback), 11-point type, restrained blue headings, and simple running headers.
Mathematical fonts remain unchanged. This style is also used by the instructor
edition and the complete-book PDF. The exercise index
has been removed in favor of the end-of-chapter exercise section.

Practice prompts, exercise statements, and the chapter recap use semantic boxes
in both formats. Their HTML styles are in `style.css`; the page-breakable PDF
environments are in `pdf-boxes.tex` (loaded by `preamble.tex`). Boxed material
keeps the existing exercise labels and cross-references.

Definitions and assumptions have pale blue-grey boxes; propositions and theorems
have pale green boxes. Examples have pale sand boxes in both formats; PDF
example frames can continue across pages and retain their figures and tables.
HTML boxes have distinct headings and adapt to narrow screens and reader colour
themes. Exercises retain transparent HTML interiors. Proofs remain outside these frames. These styles are shared
by the HTML and PDF builds, and apply to the complete book.

### Publishing the pilot changes

`preview/` is intentionally ignored by Git. Pushing source changes alone will not
replace the rendered book in `docs/`. Before publishing the complete book, restore
the recorded R environment and run `Rscript --vanilla scripts/build.R all`, then
review and commit the updated `docs/` output together with the source changes.
Include the new `pdf-boxes.tex` file: `preamble.tex` depends on it. The modern Arial
PDF style is selected in both the pilot and complete-book configurations.
Never copy the sibling instructor materials into `docs/` or this repository.

### Show or hide solutions

At the top of `index.Rmd`, change the single switch:

```yaml
params:
  show_solutions: false
```

- `false`: student book, exercises only (the default).
- `true`: the same book with private hints and solutions following each exercise.

Run the same build command shown above. The pilot reads this setting from
`index.Rmd`. Student pilot outputs go to `preview/basics/`; instructor pilot
outputs go to `../Instructor_materials/Basic_Statistical_Results/Textbook-pilot/`.
For the complete book, `scripts/build.R` uses `docs/` for students and the private
`Textbook/` folder for instructors. The complete build still requires the recorded
R environment. With solutions enabled, use these scripts rather than Knit;
direct rendering inside the repository stops before loading any answers.

The switch controls both HTML and PDF. PDF typography is configured separately
from HTML styling. Questions, ordering, and numbering are shared; private answers
are matched by stable ID. No review-confirmation or separate companion build is
needed. When revising a question, revise its private answer as needed. Keep
`show_solutions: false` for public builds and keep the instructor folder private.
Private Markdown is the editable source; generated TeX is an export.

The switch currently covers the seven pilot exercises. A student build works
without the private folder. An instructor build requires it. An optional
`ECOSTAT_INSTRUCTOR_DIR` can point to another private folder outside the repository.
Run `Rscript --vanilla scripts/check-instructor-sync.R` to test edition separation.
