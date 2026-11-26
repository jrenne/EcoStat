# Reproducible course environment — November 2026

Companion package: **AEC 0.2.0**, supplied as a source archive in
`packages/`, with a SHA-256 manifest. The course does not install a moving
GitHub branch or use an unrelated globally installed copy.

Use R 4.5.1. From the complete course source directory:

```sh
Rscript --vanilla scripts/setup.R
Rscript --vanilla scripts/build.R all
```

Setup restores the CRAN versions in `renv.lock` into `renv/library/`; it then
installs the checked companion archive into `.course-library/`. Both are
ignored by Git. CRAN restoration requires internet; subsequent course builds
use the installed dependencies and packaged data without live data downloads.
Use `html` or `pdf` instead of `all` for a single format. Pandoc is required;
PDF also needs XeLaTeX. On macOS the build discovers RStudio's bundled Pandoc.
Each format runs in a fresh R session. Existing global packages are unchanged.

The companion package's `DATA-SOURCES.md` and `COPYRIGHTS` notices record
source-specific data terms; the book's own licence does not override them.
An archive checksum mismatch is an error, never a request to fetch newer data.

Maintainers can explicitly select a newly reviewed source archive with
`Rscript --vanilla scripts/update-companion.R /path/to/package_version.tar.gz`.
Then run `scripts/check-companion.R` and rebuild both formats. This maintenance
step updates the SHA-256 manifest; normal course builds never update it.

Older installation/migration notes below are retained as historical context;
the commands above supersede instructions to use GitHub HEAD or AEC_SOURCE_DIR.

---

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

## Archived GMM application

The current Chapter 6 uses `AEC::CHhydro` and `AEC::UCIcredit` offline. It no
longer needs FRED downloads, a private historical snapshot, or Yahoo SMI data.
The former stochastic-discount-factor application and its archived-input
helpers (`R/gmm-data.R`, `scripts/refresh-gmm-data.R`) are retained for historical
work outside the chapter; they are not executed by the book. The historical
loader still validates its original 1990–2022 window rather than silently
substituting recent observations. Provider terms continue to apply to any
separate reuse of those archives.

## Verification and maintenance

Run `Rscript --vanilla scripts/check-maintenance.R` after restoring the environment. During the data migration, use the same `AEC_SOURCE_DIR` override as for the book build. It checks the UCI credit-limit comparison against an independent formula, independence of the package data, and the archived snapshot validator.

Tables are formatted for both HTML and PDF through `R/table-format.R`; HTML code is collapsed by default. Build the complete book when checking cross-references: old chapter-only output may contain unresolved references even when the target exists in another chapter.

The repository is [jrenne/EcoStat](https://github.com/jrenne/EcoStat). Except where otherwise indicated, original material in the current edition is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/); earlier versions released under CC0 remain under CC0, and third-party datasets retain their own source terms.

## Exercise bank and instructor edition

The eight teaching chapters contain 53 end-of-chapter exercises adapted from the
Spring 2026 Overleaf exercise collection. Student statements and metadata live in
the topic directories under `exercises/`, one Markdown file per exercise:

- `basics`: 7 exercises;
- `clt`: 6 exercises;
- `tests`: 4 exercises;
- `regressions`: 13 exercises;
- `panel`: 4 exercises;
- `estimation`: 9 exercises;
- `binary`: 5 exercises;
- `time-series`: 5 exercises.

These files are the maintained textbook versions; the original Overleaf
collection is unchanged. Each exercise has a stable ID, descriptive title,
level, type, and link to its prerequisite section. `R/exercises.R` generates the
exercise section at the end of each chapter. Do not edit generated HTML or TeX
to change an exercise.

With `show_solutions: false`, answers and hints are absent from the generated
HTML and PDF. Private answer sources stay outside this repository in
`../Instructor_materials/Basic_Statistical_Results/`.

When revising the first chapter, an isolated student preview can be built without
rebuilding or replacing `docs/`:

```sh
Rscript --vanilla scripts/build-basics-pilot.R
```

This uses the available R installation with `bookdown`, `rmarkdown`, `knitr`, and
Pandoc, plus XeLaTeX for PDF. It does not enforce the complete book's lockfile
because it executes only the first chapter. Outputs are in `preview/basics/`
(ignored by Git). The preview includes reference blocks drawn directly from the
other chapters so its internal references resolve. Use the complete-book build
to validate navigation and cross-references across all chapters.

During the dataset migration, the first chapter uses the new `AEC::UCIcredit`
snapshot, which is not in the historical GitHub commit pinned above. Build its
preview against the revised local AEC source by setting `AEC_SOURCE_DIR`:

```sh
AEC_SOURCE_DIR=/path/to/AEC Rscript --vanilla scripts/build-basics-pilot.R
```

The preview installs that source into a temporary library, leaving the user's
installed AEC and the complete-book lockfile unchanged. It also respects the
`show_code_in_pdf` switch in `index.Rmd`. The first migration step adds recorded
default shares, Bernoulli moments and an age-group variance decomposition to
chapter 1. Toy probability tables and mathematical simulations are retained
where they make the calculations easier to follow. Chapter 2 uses credit limits from
`UCIcredit` for its LLN, Chebyshev and CLT simulations, and the default indicator
for its two-group comparison;
the SHP examples have been removed from that chapter. Its sampling simulations
draw with replacement from the recorded population, while the age-group
comparison states its working independence assumption. `09-Data.Rmd` describes the packaged dataset
families, their coverage, sizes and sources; examples link to its subsections.
Licence details remain in the AEC documentation. The data appendix is included
in the pilot preview. Chapter 3 retains its controlled simulations; its factory
example now uses exact binomial calibration and separates size from power, with
revised tail-probability and normality exhibits. Chapter 4 now uses Swissvotes turnout for OLS, controls, robust and clustered
inference, and held-out shrinkage, with Zurich accidents for partial regression
and HAC diagnostics. Its IV applications are explicit simulations with known
instruments. Chapter migrations from chapter 5 onwards remain to be written.

The exercise migration corrects the joint-density integration order and aligns
the Cauchy simulation with the location parameter stated in its text. The
instructor companion records exercise-specific editorial corrections.

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
themes. Exercises retain transparent HTML interiors. Proofs remain outside these
frames. These styles are shared by the HTML and PDF builds, and apply to the
complete book.

### Publishing exercise changes

`preview/` is intentionally ignored by Git. Pushing source changes alone will not
replace the rendered book in `docs/`. Before publishing the complete book, restore
the recorded R environment and run `Rscript --vanilla scripts/build.R all`, then
review and commit the updated `docs/` output together with the source changes.
Include the new `pdf-boxes.tex` file: `preamble.tex` depends on it. The modern Arial
PDF style is selected in both the focused preview and complete-book configurations.
Never copy the sibling instructor materials into `docs/` or this repository.

### Show or hide solutions

At the top of `index.Rmd`, change the single switch:

```yaml
params:
  show_solutions: false
```

- `false`: student book, exercises only (the default).
- `true`: the same book with private hints and solutions following each exercise.

Run the complete-book build command shown above. `scripts/build.R` reads this
setting from `index.Rmd` and uses `docs/` for students and the private `Textbook/`
folder for instructors. The focused first-chapter preview uses `preview/basics/`
for students and
`../Instructor_materials/Basic_Statistical_Results/Textbook-pilot/` for
instructors. The complete build requires the recorded R environment. With
solutions enabled, use these scripts rather than Knit; direct rendering inside
the repository stops before loading any answers.

The switch controls both HTML and PDF. PDF typography is configured separately
from HTML styling. Questions, ordering, and numbering are shared; private answers
are matched by stable ID. No review-confirmation or separate companion build is
needed. When revising a question, revise its private answer as needed. Keep
`show_solutions: false` for public builds and keep the instructor folder private.
Private Markdown is the editable source; generated TeX is an export.

The switch covers all 53 exercises. A student build works without the private
folder. An instructor build requires a matching private answer file for every
exercise. An optional `ECOSTAT_INSTRUCTOR_DIR` can point to another private folder
outside the repository. Run
`Rscript --vanilla scripts/check-instructor-sync.R` to check completeness and
edition separation.

The complete book accepts the same local AEC override during migration:

```sh
AEC_SOURCE_DIR=/path/to/AEC Rscript --vanilla scripts/build.R all
```

This checks the recorded environment first, then installs the supplied AEC source
into a temporary library for the build. It updates HTML and PDF in `docs/` while
leaving installed libraries and `renv.lock` unchanged. The historical pinned AEC
alone cannot run the new examples until the revised package is released.

The Chapter 3 US recession example uses `AEC::USrecession`: a fixed 1982–2024
monthly snapshot of Board H.15 Treasury yields and NBER reference dating. The
warning rule uses the spread at t to classify recession status at t+12; missing
end-of-snapshot outcomes are not scored. Its timeline aligns spreads to target
months, and its confusion table and ROC curve use the same 504 observations.
The data appendix describes this fifth family; source-specific permissions and
source/build hashes remain in AEC's help and installed construction files.

Chapter 4 uses 180 ordered city-month accident counts and 11,807 canton–object
turnout observations with 26 canton and 158 voting-day clusters. The main turnout
model controls for canton, procedure and a linear time trend. The shrinkage
comparison expands the institutional predictors and assigns entire voting days
to the training/test samples and cross-validation folds. No electricity
consumption predictor is used in Chapter 4.
No SHP, Lending Club, JST, umbrella-search, California-school, cigarette or
college-distance observations are used in Chapter 4.

The main empirical IV application in Chapter 4 now uses AEC::CHhydro: original
2016–2024 Swiss reservoir generation and day-ahead prices, German wind and
MeteoSwiss weather. It estimates a short-run production response with month-year,
weekday and temperature controls, one-week HAC uncertainty, and hydrology,
offshore, no-2022 and period checks. All six negative-price days remain.
The apple application has been removed from Chapter 4; the data remain documented in the appendix and available in AEC.
Appendix data-hydro describes the seventh family; source-specific licences and
construction evidence remain in AEC.

Chapter 4 editorial integration: the turnout data introduce the running question
before the formal assumptions. Zurich counts illustrate partial regression and
then reappear for HAC inference. The hydropower IV example reports MW per
10 EUR/MWh directly; its HAC uncertainty and sensitivity checks return after
the covariance theory. Simulated heteroskedastic replications use independent
errors, and empirical SD/mean-SE comparisons have labelled tables. Prediction
metrics and selected model sizes share a single held-out comparison.

Chapter 5 now uses the 60 apartment/house meters in CHelectricity, with 39,073
complete-import meter-days in 2023–2024. The running weekend comparison uses
meter and month–year effects; partial regression reproduces the dummy-variable
slope. Conventional, HC1, meter-clustered and meter/day-clustered uncertainties
are compared separately, with their dependence assumptions stated. CigarettesSW,
JST, Airbnb, EmplUK and injury data are no longer used in this chapter.
Random effects and dynamic panels use explicit simulations; the dynamic initial
condition uses the stationary standard deviation, and GMM uses two collapsed
lag-instrument columns with AR(1), AR(2) and overidentification diagnostics.


The Chapter 5 DiD application now uses Renne's October 2026 speed-camera
paper and AEC::FRradars, replacing the hypothetical intervention. The compact
21,939-row extraction preserves all 406 main-specification comparisons, 639
distinct sites, 2 km network reach and 100 m lateral tolerance. Equal-stack
aggregation reproduces the paper's first-year point estimate. The chapter
shows weighted four-cell means, a counterfactual plot, a prior-year diagnostic
and a physical-site bootstrap applied jointly to repeated control/treated
roles. Classroom intervals resample retained sites rather than claiming to
reproduce the archived bootstrap. Appendix data-radars documents coverage
and construction; rights and frozen source hashes stay in AEC.

Chapter 6 now links a two-instrument Swiss hydropower GMM example to Chapter 4.
The moment covariance uses seven-lag Bartlett HAC weights; the GMM coefficient
and sandwich uncertainty are computed in closed form and checked against
numerical optimization. An exponential simulation introduces likelihood with
correct density/log-likelihood labels. UCI default indicators supply a single
Bernoulli likelihood for analytic/numerical MLE, log-odds/Delta transformation,
Wald/LM/LR tests, Beta updating, and four Metropolis--Hastings chains checked
against the exact posterior. No extra dataset is added. General theory now
distinguishes optimal and general GMM weights, per-observation and estimator
variances, finite-sample test differences and posterior versus Monte Carlo
uncertainty. Code stays in the chapter and respects the PDF visibility switch.

Notation convention: identity matrices use `\mathbf{Id}`, with a dimension
subscript where appropriate, for example `\mathbf{Id}_n`. Apply this in the
chapters, appendices, exercise statements and private solutions. Distinguish
the identity from Fisher information and indicator-function notation.

Chapter 7 uses UCIcredit throughout estimation, average probability comparisons,
likelihood-based fit and held-out prediction. A reproducible random split reserves
9,000 of the 30,000 clients; every model is fitted on the other 21,000. Predictors
are log credit limit, age and a recorded-delay indicator (PAY_0 >= 1); other
repayment codes are not labelled as problem-free. Compact coefficient, effect,
fit and classification tables replace Lending Club output. A hypothetical
train/bus journey illustrates alternative-specific attributes without adding a
dataset. ROC curves aggregate ties and fix the score direction; AUC counts ties
as one half. Brier scores and calibration supplement ranking. Figures use a
consistent palette and locally scoped plotting settings. The chapter no longer
loads the old credit or Fishing datasets.

Chapter 8 replaces the JST GDP applications and VAR comparison with the packaged
Zurich monthly injury-accident series, linked to Chapter 4. The initial sample is
2011--2022; the 36 evaluation targets are January 2023--December 2025. Seasonal
profiles and AR(1) deviations are re-estimated at each month-end using past data
only. Seasonal naive, seasonal mean and seasonal-plus-AR forecasts share the same
one-month horizon and target dates. RMSE, MAE and a two-sided squared-loss
comparison (Bartlett HAC, three lags) are reported without choosing a winning
specification by significance. A separate December 2022 example illustrates
multi-step means and plug-in error variances. The exercise uses frozen counts
and an explicit month-end availability assumption, not historical publication
vintages. Theory and simulations now distinguish causal AR stability from
noncausal solutions, normalize Student shocks to variance one, initialize AR(1)
paths from their stationary distribution, and separate summable covariances
from the extra conditions for a normal CLT. Sample/population ACF/PACF plots and
all empirical figures use the course palette. No additional AEC data are needed.

## Cross-chapter consistency review

The course uses seven dataset families, mapped to chapters in `09-Data.Rmd`;
CHapples remains explicitly supplementary. The electricity appendix now includes
all three packaged tables, distinguishing the 184-meter daily panel, 2,447-meter
metadata and 2,023-residential-meter annual summaries. The PCA appendix uses the
six UCI statement balances, replacing legacy USyields. Observations remain
clients, with six monthly columns; PCA uses all 30,000 rows and only the display
subsamples 1,000 rows. Component signs change scores and loadings together.

The introduction records identity/vector/indicator and Fisher-information
notation, exact versus approximate versus limiting distributions, and installation
of the teaching-data AEC source. NTD is the common currency abbreviation.
Regression statements now distinguish conditional independence, the JF/Wald
scale, moment validity for IV, and covariance limits from a required score CLT.
The mathematical appendix uses the same information and null/alternative symbols.

After a full build, run `python3 scripts/check-course-consistency.py`. It follows
the current HTML book and checks internal pages and anchors, bibliography keys,
source reference types, duplicate chunk/TeX labels and selected notation/data
conventions. It does not contact external sites. Separately, run the maintenance
and instructor-separation checks above. Numbered equations that have separate
references use separate equation environments so their HTML anchors exist.

Example 2.3 compares next-month default shares between the same age groups
(35 or younger versus over 35), using UCIcredit's binary outcome. Earlier
Chapter 2 LLN/CLT simulations continue to use credit limits. The example uses
unpooled group sample variances, reports differences/SEs/intervals in percentage
points, and retains the existing example and figure anchors. The figure shows
both group proportions and the older-minus-younger contrast with normal 95%
intervals.

The Chapter 4 Swissvotes introduction shows six actual canton--object records
from Bern and Zurich on 2019-02-10 and 2024-03-03, explaining the repeated
objects and shared daily proposal counts before estimation. The grouped-means
plot retains its figure anchor but now appears in the later OLS example. Its
text explains aggregation and why fitting all observations differs from giving
each displayed mean equal weight. All regression specifications are unchanged.

Chapter 4 now opens with Paris injury accidents and independent Montsouris
rainfall (`AEC::FRaccidents_daily`), replacing Swissvotes in the introductory
and first OLS boxes. Six real rows explain the observation unit. Daily accident
intervals match the rain gauge's 06-to-06 UTC totals. The first regression uses
large-sample HAC inference; calendar controls and later HC/HAC comparisons reuse
this same data. Swissvotes is introduced at the two-way clustering application
and retained for shrinkage. The data appendix documents the new compact table;
redistribution details stay in AEC help. Construction sources are installed.

The Paris introduction table now includes English weekday names. Example 4.4
focuses on the fitted line, coefficient estimates and their units; its HAC
standard errors, tests and confidence intervals are deferred to the HAC example.
The early inference discussion distinguishes the Gaussian theory from the
later empirical covariance choice without introducing HAC details prematurely.

Section `regression-prediction-intervals`, immediately before instrumental
variables, distinguishes conditional-mean confidence intervals from prediction
intervals for a new outcome. It derives the classical extra disturbance-variance
term and shows the Paris daily scatter with a pointwise 95% confidence band for
the linear mean. The empirical band uses the same seven-lag Newey-West covariance
as the later HAC application, with technical construction confined to code and
the covariance section. No Gaussian prediction band is asserted for the counts.

Immediately below the simulated heteroskedasticity figure, a boxed empirical
example uses CHelectricity_annual's 1,234 complete-year 2023 residential meters.
It compares apartments and houses after subtracting each type's mean, reports
within-type standard deviations, and plots centred observations on a common
scale. All eligible meters remain in the figure. The data appendix now records
this use of the annual table; no additional package data are required.

The omitted-variables section now motivates controls as defining the comparison
of interest. A scalar population omitted-variable formula precedes the matrix
result, with both conditions for bias, its possible direction, and why sample
size does not fix it. The Frisch-Waugh interpretation connects controls to
residual variation. The Paris example explains the roles of calendar indicators,
the meaning of its modest coefficient change, and how controlling for a variable
such as traffic volume can change the question. No estimates or samples changed.

The omitted-variables application now uses 1,229 stable-equipment, complete-year
2023 residential meters: the electric-water-heater coefficient falls from 18.58
to 7.07 kWh/day after housing-type control. Group sizes, means and within-type
contrasts explain the adjustment. Rainfall calendar controls remain a separate
specification in the HAC comparison, with its introduction and references updated.
Multicollinearity now includes the communicating-vessels interpretation, the
negative coefficient-estimator correlation under classical two-regressor theory,
and a real UCI balance application. All 30,000 clients enter estimation; a
1,000-row display sample shows the correlated predictors. An approximate joint
95% confidence ellipse uses HC1 covariance, distinguished from the exact
classical correlation identity. The data appendix records both new uses.
The final correlated-balance example uses the recorded September payment
(PAY_AMT1) as the outcome and July/August balances as predictors. This gives
roughly fourfold increases in both robust standard errors when both balances
enter, and a coefficient-estimator correlation near -0.966. Housing-control
cell means and counts are combined in one compact table for readability.

The large gap before the electric-water-heater controls example came from a
43-line space reservation; this now reserves only eight lines, allowing the box
to start in available space. The shrinkage example now predicts UCI defaults
using 14 transformed numeric predictors, categorical client/history variables,
squares and numeric pairwise products. It removes exact training-design
redundancies and evaluates a common expanded design for OLS, ridge and lasso.
Cross-validation uses only 21,000 training clients, with 9,000 reserved clients
for the final squared-error comparison. These are linear default scores;
Chapter 7 introduces bounded probability models. No data or package change.

The shrinkage comparison now audits three pre-specified feature dictionaries on
training clients only: quadratic (186 columns), common-status interactions (480)
and cubic (746). R/credit-shrinkage-design.R shares their outcome-free construction
and training-only rank checks; scripts/check-credit-shrinkage-specifications.R
reproduces the stored five-fold CV table. Seed 17828 preserves the original
21,000/9,000 split and folds. Cubic lasso has marginally lowest CV loss, while
unpenalised cubic OLS is appreciably worse. Final evaluation retains quadratic
OLS and a clipped-score diagnostic to expose the limits of the gain rather than
selecting features from held-out performance. No random/noise predictors, reduced
training sample, or held-out tuning were introduced. The isolated confidence-
interval table that occupied an almost empty page is merged with HAC inference.
