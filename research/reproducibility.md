# ATLAS — Computational Reproducibility Record

## Python and R implementation

The FY2025 primary Spearman correlation analysis was independently
implemented in Python and R.

### Primary analysis

- 18 governance-performance relationships calculated in R.
- 18 of 18 results matched the Python reference.
- Maximum absolute numerical difference was approximately
  5.0 × 10^-16.

### Nonbank sensitivity

- 18 correlations recalculated after excluding JPM and BAC.
- 18 of 18 results matched Python.

### Leave-one-out sensitivity

- Four selected relationships recalculated in R.
- Four of four summary results matched Python.
- Forty individual leave-one-out calculations were generated.

### Total comparison results

40 of 40 comparison results matched within the specified numerical
tolerance. Remaining differences are attributable to floating-point
precision.

## Saved R scripts

- `src/R/replicate_spearman_fy2025.R`
- `src/R/robustness_replication_fy2025.R`

## Saved R outputs

- `data/processed/spearman_correlations_fy2025_R.csv`
- `data/processed/nonbank_sensitivity_fy2025_R.csv`
- `data/processed/leave_one_out_sensitivity_fy2025_R.csv`
- `data/processed/leave_one_out_details_fy2025_R.csv`

## Replication audit

- `data/processed/python_r_replication_audit.csv`
- `data/processed/python_r_replication_audit.txt`

## Updated figures

Seven updated figures were generated using the corrected FY2025
integrated dataset and validated results. They are stored in
`data/processed/figures/`.

## Interpretation

Cross-language agreement demonstrates computational consistency
between the two implementations. It does not independently prove
that source documents are complete, that every variable is measured
without error, or that the observed relationships are causal.
