
# ATLAS: Independent R replication of FY2025 Spearman correlations

input_file <- "/content/data/processed/integrated_governance_financials_fy2025_v2.csv"
output_file <- "/content/data/processed/spearman_correlations_fy2025_R.csv"

df <- read.csv(input_file, stringsAsFactors = FALSE)

governance_vars <- c(
  "governance_board_independence_pct",
  "governance_board_size",
  "governance_ceo_chair_separation",
  "governance_committee_count",
  "governance_independent_committee_membership",
  "governance_ceo_incentive_compensation_pct"
)

financial_outcomes <- c(
  "ratio_net_profit_margin",
  "ratio_revenue_growth",
  "ratio_operating_cash_flow_margin"
)

required_columns <- c(governance_vars, financial_outcomes)
missing_columns <- setdiff(required_columns, names(df))

if (length(missing_columns) > 0) {
  stop(paste("Missing required columns:", paste(missing_columns, collapse = ", ")))
}

results <- data.frame()

for (g in governance_vars) {
  for (outcome in financial_outcomes) {

    x <- df[[g]]
    y <- df[[outcome]]

    valid <- complete.cases(x, y)
    n <- sum(valid)

    rho <- if (n >= 3) {
      cor(x[valid], y[valid], method = "spearman")
    } else {
      NA_real_
    }

    results <- rbind(
      results,
      data.frame(
        governance_variable = g,
        financial_outcome = outcome,
        companies_compared = n,
        spearman_rho = rho
      )
    )
  }
}

write.csv(results, output_file, row.names = FALSE)

cat("R replication complete.\\n")
cat("Companies in integrated dataset:", nrow(df), "\\n")
cat("Correlation relationships calculated:", nrow(results), "\\n")
cat("Output:", output_file, "\\n")
print(results)
