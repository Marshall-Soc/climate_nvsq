
# -----------------------------------------------------------------------------
# Descriptive stats by year and org
# -----------------------------------------------------------------------------

  # By year
tweets |>
  group_by(year) |>
  count() |>
  ungroup() |>
  summarize(mean_yr = mean(n),
            sd_yr = sd(n),
            median_yr = median(n),
            q1_yr = quantile(n, .25),
            q3_yr = quantile(n, .75),
            min_yr = min(n),
            max_yr = max(n)) |>
  print()

  # By org
tweets |>
  group_by(username) |>
  count() |>
  ungroup() |>
  summarize(mean_org = mean(n),
            sd_org = sd(n),
            median_org = median(n),
            q1_org = quantile(n, .25),
            q3_org = quantile(n, .75),
            min_org = min(n),
            max_org = max(n)) |>
  print()
