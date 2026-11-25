
# ATLAS: R robustness replication

input_file <- "/content/data/processed/integrated_governance_financials_fy2025_v2.csv"
df <- read.csv(input_file, stringsAsFactors = FALSE)

governance_vars <- c(
  "governance_board_independence_pct",
  "governance_board_size",
  "governance_ceo_chair_separation",
  "governance_committee_count",
  "governance_independent_committee_membership",
  "governance_ceo_incentive_compensation_pct"
)

outcomes <- c(
  "ratio_net_profit_margin",
  "ratio_revenue_growth",
  "ratio_operating_cash_flow_margin"
)

# --------------------------------------------------
# 1. Nonbank sensitivity: exclude JPM and BAC
# --------------------------------------------------

nonbank <- df[!df$ticker %in% c("JPM", "BAC"), ]

nonbank_results <- data.frame()

for (g in governance_vars) {
  for (outcome in outcomes) {
    valid <- complete.cases(nonbank[[g]], nonbank[[outcome]])
    n <- sum(valid)

    rho <- if (n >= 3) {
      cor(nonbank[[g]][valid], nonbank[[outcome]][valid],
          method = "spearman")
    } else {
      NA_real_
    }

    nonbank_results <- rbind(
      nonbank_results,
      data.frame(
        governance_variable = g,
        financial_outcome = outcome,
        companies_compared = n,
        spearman_rho_excluding_banks = rho
      )
    )
  }
}

write.csv(
  nonbank_results,
  "/content/data/processed/nonbank_sensitivity_fy2025_R.csv",
  row.names = FALSE
)

# --------------------------------------------------
# 2. Leave-one-out sensitivity: four selected pairs
# --------------------------------------------------

selected <- data.frame(
  governance_variable = c(
    "governance_board_size",
    "governance_ceo_incentive_compensation_pct",
    "governance_independent_committee_membership",
    "governance_board_independence_pct"
  ),
  financial_outcome = c(
    "ratio_revenue_growth",
    "ratio_net_profit_margin",
    "ratio_net_profit_margin",
    "ratio_net_profit_margin"
  )
)

loo_summary <- data.frame()
loo_details <- data.frame()

for (i in seq_len(nrow(selected))) {

  g <- selected$governance_variable[i]
  outcome <- selected$financial_outcome[i]

  valid <- complete.cases(df[[g]], df[[outcome]])
  pair_data <- df[valid, ]

  full_rho <- cor(
    pair_data[[g]],
    pair_data[[outcome]],
    method = "spearman"
  )

  omitted_rhos <- numeric()

  for (ticker in pair_data$ticker) {
    reduced <- pair_data[pair_data$ticker != ticker, ]

    rho <- cor(
      reduced[[g]],
      reduced[[outcome]],
      method = "spearman"
    )

    omitted_rhos <- c(omitted_rhos, rho)

    loo_details <- rbind(
      loo_details,
      data.frame(
        governance_variable = g,
        financial_outcome = outcome,
        omitted_company = ticker,
        companies_compared = nrow(reduced),
        spearman_rho = rho
      )
    )
  }

  minimum <- min(omitted_rhos)
  maximum <- max(omitted_rhos)

  consistent <- if (full_rho > 0) {
    minimum > 0
  } else if (full_rho < 0) {
    maximum < 0
  } else {
    FALSE
  }

  loo_summary <- rbind(
    loo_summary,
    data.frame(
      governance_variable = g,
      financial_outcome = outcome,
      companies_compared = nrow(pair_data),
      full_sample_rho = full_rho,
      leave_one_out_min = minimum,
      leave_one_out_max = maximum,
      direction_consistent = consistent
    )
  )
}

write.csv(
  loo_summary,
  "/content/data/processed/leave_one_out_sensitivity_fy2025_R.csv",
  row.names = FALSE
)

write.csv(
  loo_details,
  "/content/data/processed/leave_one_out_details_fy2025_R.csv",
  row.names = FALSE
)

cat("R robustness calculations complete.\\n")
cat("Nonbank correlations:", nrow(nonbank_results), "\\n")
cat("Leave-one-out relationships:", nrow(loo_summary), "\\n")
cat("Individual leave-one-out calculations:", nrow(loo_details), "\\n")
