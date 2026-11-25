# ATLAS — Research Methodology

## 1. Research Design

ATLAS uses an observational, comparative research design to examine
relationships between corporate governance characteristics and
financial performance among publicly traded companies.

The central research question is:

**How are corporate governance structures, executive incentive
compensation, and selected organizational characteristics associated
with financial performance across companies in different industries?**

The study is exploratory. It evaluates associations rather than
attempting to establish causal effects.

## 2. Company Selection and Sample

The sample contains ten publicly traded U.S. companies across five
industries, with two companies selected from each industry.

| Industry | Companies |
|---|---|
| Technology | Apple (AAPL), Microsoft (MSFT) |
| Banking | JPMorgan Chase (JPM), Bank of America (BAC) |
| Retail | Walmart (WMT), Costco (COST) |
| Energy | Exxon Mobil (XOM), Chevron (CVX) |
| Pharmaceuticals | Pfizer (PFE), Merck (MRK) |

The sample is purposive rather than randomly selected. It supports
structured comparisons but is not statistically representative of
all public companies or their industries.

## 3. Data Collection

### Financial data

Financial statement data covers fiscal years 2022–2025. The study
uses SEC filings and SEC Company Facts data.

The eight financial measures collected were:

- Revenue
- Operating income
- Net income
- Total assets
- Total liabilities
- Operating cash flow
- Research and development expense
- Capital expenditures

The primary integrated analysis matches FY2025 governance observations
with FY2025 financial performance measures.

### Corporate governance data

Governance information was collected from FY2025 proxy statements
(DEF 14A filings) and related company disclosures.

The governance dataset contains 11 variables:

1. Board size
2. Independent director count
3. Board independence percentage
4. CEO-chair separation
5. Board committee count
6. Independent committee membership
7. Special-meeting threshold
8. Proxy-access threshold
9. CEO total compensation
10. CEO incentive compensation percentage
11. Clawback policy

Each coded observation includes source and coding metadata, including
the filing, accession information, source excerpt, and coding status
where available.

## 4. Variable Construction

### Financial ratios

Six financial ratios were constructed:

- Revenue growth = (current-year revenue − prior-year revenue) /
  prior-year revenue × 100
- Net profit margin = net income / revenue × 100
- Liabilities-to-assets = total liabilities / total assets × 100
- Operating cash flow margin = operating cash flow / revenue × 100
- R&D intensity = R&D expense / revenue × 100
- Capital expenditure intensity = capital expenditures / revenue × 100

The six formulas were independently checked against the FY2025
integrated dataset. All six formula checks passed.

### CEO incentive compensation

The standardized CEO incentive compensation share is:

**(Bonus + Stock Awards + Option Awards + Non-Equity Incentive
Compensation) / Summary Compensation Table Total Compensation × 100**

Salary, pension/deferred compensation, and all-other compensation
are excluded from the numerator.

The calculation was reconstructed from the individual components
reported in each company's Summary Compensation Table. All ten
reconstructed totals reconciled with reported total compensation.

### Other governance variables

CEO-chair separation is coded as a binary indicator distinguishing
separate leadership roles from a combined CEO-chair role.

Independent committee membership is coded as a binary indicator
based on whether all standing Board committees are composed
exclusively of independent members.

Missing governance thresholds are retained as missing values when
a numerical threshold was not identified in the reviewed disclosure.
Missing values are not automatically interpreted as zero.

Board-size and board-independence measurements require a comparability
caveat: the disclosed director population is not perfectly uniform
across every company. Some filings refer to director nominees, while
others describe currently serving directors or a post-election Board.
This affects strict cross-company comparability and is disclosed as
a measurement limitation.

## 5. Analytical Methods

### Primary analysis

Spearman rank correlations were calculated for six governance
variables against three financial outcomes:

- Net profit margin
- Revenue growth
- Operating cash flow margin

This produces 18 exploratory relationships using the ten-company
FY2025 integrated dataset.

Spearman correlation was selected because it measures monotonic
rank association and does not require the relationship to be linear.

### Sensitivity analysis

Two robustness procedures were used:

1. **Nonbank sensitivity:** Recalculate all 18 correlations after
   excluding JPMorgan Chase and Bank of America. This produces an
   eight-company nonbank sample.
2. **Leave-one-out sensitivity:** Recalculate four selected
   relationships after omitting each company individually. The
   resulting coefficient range indicates whether a relationship's
   direction is sensitive to any single company.

Within-industry pairwise comparisons were also used for selected
governance-performance relationships.

### Cross-language replication

The primary correlations and robustness analyses were independently
implemented in Python and R. Results were compared numerically to
check computational reproducibility.

## 6. Missing Data and Comparability

Missing observations were retained rather than imputed.

A missing financial metric may reflect disclosure differences,
industry-specific reporting, or limitations in the extraction process.
It does not automatically establish that a company did not incur
the expense or activity.

Banking companies have business models and balance-sheet structures
that differ substantially from nonfinancial companies. In particular,
liabilities-to-assets and operating cash flow measures may not be
directly comparable across banks and nonfinancial firms.

The nonbank sensitivity analysis provides a supplementary check
rather than a replacement for the full-sample analysis.

## 7. Research Limitations

The study has a small purposive sample of ten companies, with only
two companies per industry. It uses a single FY2025 governance
cross-section matched with FY2025 financial outcomes.

Industry characteristics, company size, business models, accounting
policies, economic conditions, and other unmeasured factors may
influence the observed relationships.

The analysis cannot establish that a governance characteristic
caused a financial outcome. Correlations are exploratory and should
not be interpreted as evidence of causal effects.

Measurement differences in board populations and incomplete
financial metric coverage further limit strict comparability.


## 8. Board Population Measurement Audit

A source-level audit reviewed board size, independent director counts,
and board independence percentages for all ten companies.

The numerator and denominator reconcile arithmetically for all ten
companies. However, the population basis is not identical across
issuers. Six companies use director nominees or a proposed Board;
COST uses currently serving directors excluding a nominee; CVX uses
its current Board before a disclosed reduction effective at the 2026
annual meeting; and PFE and XOM use currently serving directors.

The original source-verified values were preserved. They were not
artificially converted to a common population definition where the
proxy disclosures did not support that conversion.

The company-specific population basis is documented in
`data/processed/board_measurement_population_audit.csv`. This
difference remains a limitation on strict cross-company comparisons
of board size and board independence.
