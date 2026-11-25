# ATLAS: Corporate Intelligence Research

An interdisciplinary research project examining relationships between corporate governance, executive incentives, and financial performance across ten publicly traded companies in five industries.

## 1. Research Overview

ATLAS investigates how selected corporate governance characteristics and executive compensation structures are associated with corporate financial performance.

The project combines financial statement analysis, corporate governance research, executive compensation analysis, and statistical testing.

**Central Research Question:**

How are selected corporate governance characteristics associated with financial performance across companies operating in different industries?

The study is observational. Its results identify statistical relationships and do not establish causation.

## 2. Company Sample

The research examines ten publicly traded companies across five industries.

| Industry | Companies |
|---|---|
| Technology | Apple (AAPL), Microsoft (MSFT) |
| Banking | JPMorgan Chase (JPM), Bank of America (BAC) |
| Retail | Walmart (WMT), Costco (COST) |
| Energy | Exxon Mobil (XOM), Chevron (CVX) |
| Pharmaceuticals | Pfizer (PFE), Merck (MRK) |

## 3. Research Components

### Financial Analysis

Financial measures cover fiscal years 2022–2025 and include:

- Revenue
- Operating income
- Net income
- Total assets
- Total liabilities
- Operating cash flow
- Research and development expenses
- Capital expenditures

Financial ratios include revenue growth, net profit margin, liabilities-to-assets, operating cash flow margin, R&D intensity, and capital expenditure intensity.

### Corporate Governance

The governance analysis examines selected characteristics, including:

- Board size
- Board independence
- Independent committee representation
- CEO incentive compensation

### Statistical Analysis

The project uses Spearman rank correlations to examine relationships between governance measures and financial performance.

Robustness analyses include:

- Nonbank-company sensitivity analysis
- Leave-one-company-out sensitivity analysis
- Python–R replication comparisons

## 4. Data and Methodology

Financial data covers FY2022–FY2025. Governance and executive compensation analyses primarily use FY2025 observations.

The research uses publicly available corporate disclosures and SEC filing information.

The processed financial dataset contains 268 observations, while the financial ratio dataset contains 240 observations. The governance coding dataset contains 110 records.

Data validation includes duplicate checks, formula reconstruction, missingness assessments, compensation reconciliation, and cross-language statistical replication.

See the [methodology](research/methodology.md), [data dictionary](research/data_dictionary.md), and [research proposal](research/research_proposal.md).

## 5. Validation and Reproducibility

The project includes independent Python and R replication checks.

Reported validation results include:

- 18/18 primary Spearman correlation comparisons matched.
- 18/18 nonbank sensitivity comparisons matched.
- 4/4 leave-one-out summary comparisons matched.
- All 40 reported Python–R replication comparisons matched across the primary, nonbank sensitivity, and leave-one-out analyses.

Financial ratio reconstruction was also checked against the integrated FY2025 dataset, with 60/60 observations matching.

The repository contains processed datasets, validation reports, statistical results, research figures, and R replication scripts.

See the [reproducibility documentation](research/reproducibility.md) and [research findings](research/findings.md).

## 6. Repository Structure

```text
atlas-corporate-intelligence/
├── data/
│   ├── raw/
│   │   └── governance_source_inventory.csv
│   └── processed/
│       └── figures/
├── documentation/
│   └── technical_stack.md
├── research/
│   ├── data_dictionary.md
│   ├── findings.md
│   ├── limitations.md
│   ├── methodology.md
│   ├── reproducibility.md
│   └── research_proposal.md
├── src/
│   └── R/
│       ├── replicate_spearman_fy2025.R
│       └── robustness_replication_fy2025.R
├── .gitignore
├── LICENSE
└── README.md
```

## 7. Technology Stack

- Python
- R
- Pandas
- NumPy
- Matplotlib
- SciPy
- SEC EDGAR public filing information
- Google Colab
- GitHub

See the [technical stack documentation](documentation/technical_stack.md).

## 8. Limitations

This study has several limitations:

- The sample contains only ten companies, with two companies representing each industry.
- Governance disclosures and measurement definitions may differ across companies.
- Some financial ratio observations are missing because the underlying financial metrics are unavailable.
- The study relies on observational data and cannot establish causal relationships.
- The findings may not generalize to all companies or industries.

See the [research limitations](research/limitations.md).

## 9. Source Documentation

The repository includes an inventory documenting ten SEC DEF 14A proxy statement source files, including their filenames and accession numbers.

The original proxy statement text files, 10-K filings, and Company Facts JSON files are not currently archived in this repository. The source inventory documents the proxy statement files but should not be interpreted as an archive of the original filings.

## 10. Project Status

ATLAS is maintained as a private research repository. Its datasets, analyses, validation records, figures, and documentation are organized to support transparency and reproducibility.

Further work may expand the company sample, improve source-file archiving, and extend the analysis across additional fiscal years.
