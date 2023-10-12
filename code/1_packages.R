
# -----------------------------------------------------------------------------
# PACKAGES
# -----------------------------------------------------------------------------

if(!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, BTM,
               readxl, gmodels,
               psych, FactoMineR,
               factoextra, ggpubr,
               lubridate, plm,
               Hmisc, ggcorrplot,
               tidytext, quanteda,
               Matrix, slam, tm,
               install = TRUE)
