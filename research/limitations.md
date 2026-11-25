# ATLAS — Research Limitations

## Sample size and selection

The study contains ten purposively selected companies, with two
companies per industry. This is a small sample and does not support
broad statistical generalization to all public companies.

## Industry effects

Companies in different industries have different operating models,
capital structures, regulatory environments, and accounting
characteristics. These differences may influence both governance
structures and financial outcomes.

The banking industry is particularly difficult to compare directly
with nonfinancial industries using certain balance-sheet and cash
flow ratios. Excluding banks in a sensitivity analysis helps reveal
the influence of those observations but does not eliminate all
industry-related confounding.

## Governance measurement

Board-size and board-independence disclosures do not always describe
identical director populations. Some values are based on nominees,
while others refer to currently serving directors or a Board after
an anticipated election. This reduces strict comparability.

Governance coding also depends on the wording and scope of each
company's proxy statement. A disclosure not found in the reviewed
material should not automatically be interpreted as proof that a
policy does not exist.

## Financial data coverage

Some financial metrics are missing for certain companies. Missing
values were retained rather than imputed. Missingness may result
from industry-specific reporting, source extraction limitations,
or differences in financial statement presentation.

## Timing

The primary analysis matches FY2025 governance characteristics with
FY2025 financial outcomes. It does not establish whether governance
characteristics preceded financial outcomes or whether governance
changed in response to company performance.

## Correlation and causality

Spearman correlations measure rank association. They do not control
for all possible confounding variables and cannot establish causal
relationships.

The study is exploratory. Coefficients should not be interpreted
as causal effects or as evidence that a governance practice will
improve a company's performance.

## Statistical power and inference

With only ten companies, estimates can be sensitive to individual
observations. Leave-one-out and nonbank sensitivity analyses help
describe this sensitivity but do not substitute for a larger sample.

The study examines multiple relationships. Findings should be
interpreted as exploratory patterns rather than definitive
confirmatory tests.


## Board population definitions

A source-level audit confirmed that all ten board-independence
percentages reconcile with their reported independent-director
counts and board-size denominators. However, the underlying
populations differ: some values describe nominees or a proposed
Board, while others describe currently serving directors.

The original verified values were preserved rather than forcing
unsupported adjustments. Company-specific definitions are recorded
in `data/processed/board_measurement_population_audit.csv`.
Consequently, board-size and board-independence comparisons should
be interpreted with this measurement limitation in mind.
