# ATLAS — Technical Stack

## 1. Overview

ATLAS uses a combination of Python and R to support data engineering, statistical research, and software development.

Each technology has a defined responsibility to avoid unnecessary duplication.

## 2. Programming Languages

### Python

Primary responsibilities:
- SEC EDGAR data collection.
- Financial data processing and validation.
- Corporate disclosure organization.
- Financial calculations.
- Dashboard development.

Planned libraries:
- Pandas
- NumPy
- Requests
- Matplotlib
- Plotly
- Streamlit

### R

Primary responsibilities:
- Statistical analysis.
- Exploratory regression modeling.
- Financial performance comparisons.
- Statistical testing.
- Research visualizations.

Planned packages:
- tidyverse
- ggplot2
- broom
- readr
- janitor

## 3. Data Infrastructure

Primary data source:
- SEC EDGAR filings and Company Facts API.

Additional sources:
- Company annual reports.
- Proxy statements.
- Official regulatory publications.

Data will be stored in standardized CSV formats with documented variable definitions and source references.

## 4. Dashboard

Streamlit will provide the interactive ATLAS interface.

Planned features:
- Company and industry comparisons.
- Financial performance visualizations.
- Governance indicator comparisons.
- Business strategy summaries.
- Statistical research findings.

## 5. Version Control

GitHub will host:
- Source code.
- Research documentation.
- Data dictionaries.
- Reproducible analytical workflows.
- Research findings and project updates.

## 6. Reproducibility and Integrity

The project will document software dependencies, data sources, analytical methods, and processing decisions.

Python and R outputs will be checked for consistency where they perform related calculations.

## 7. Development Principles

- Prioritize free and open-source technologies.
- Use authoritative public data.
- Maintain reproducible analytical workflows.
- Avoid unsupported causal conclusions.
- Document missing data and methodological limitations.
- Keep the system modular so components can be tested independently.
