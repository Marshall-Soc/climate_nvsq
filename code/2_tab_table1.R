
# -----------------------------------------------------------------------------
# Cross-tab of orgs by size and scope
# -----------------------------------------------------------------------------

  # Recode to get meaningful labels
org.data$Size <- recode(org.data$Size, 
                        `1` = "Small", `2` = "Medium", `3` = "Large")
org.data$`Scope of Work` <- recode(org.data$`Scope of Work`, 
                        `1` = "Regional", `2` = "National", `3` = "International")

  # Get table
table(org.data$Size, org.data$`Scope of Work`) |>
  CrossTable()
