
# -----------------------------------------------------------------------------
# DATA
# -----------------------------------------------------------------------------
  # Load in tweet IDs and associated pre-computed topics
tweets <- readRDS("data/tweets_data.rds") #Note that you will need to rehydrate
                                    #using the tweet IDs. THE REMAINDER OF THIS
                                    #REPO ASSUMES YOU HAVE REHYDRATED THE 
                                    #TWEETS.
tweets <- cbind(tweets, tweets$public_metrics)

  # Load in organizational characteristic data
org.data <- read_excel("data/org_characteristics.xlsx")

org.data <- org.data |>
  mutate(username = str_remove(TwitterHandle, "@"))

org.data$`Year of Est` <- str_trim(org.data$`Year of Est`) |>
  as.numeric()

  #Merge with the REHYDRATED (see above) tweet data
tweets <- left_join(tweets, org.data, by = "username")

  #Load in mission statement data
ms.data <- read_excel("data/ms_codes.xlsx")

  #Load in BTM object
topics <- readRDS("data/climate_topics.rds")

  #Load in user IDs for user-level data in the heatmap plot. THESE WILL ALSO
    #NEED TO BE REHYDRATED
users <- readRDS("data/users_data.rds")


# -----------------------------------------------------------------------------
# SCRIPTS
# -----------------------------------------------------------------------------
  # Load necessary packages
source("code/1_packages.R")

  #Create Table 1
source("code/2_tab_table1.R")

  #Create Table 2
source("code/2_tab_table2.R")

  #Create Table 3
source("code/2_tab_table3.R")

  #No code for Table 4 -- it is derived from output from Figure 1

  #Create Figure 1
source("code/3_fig_figure1.R")

  #Create Figure 2
source("code/3_fig_figure2.R")

  #Create Figures 3 and 4 (minus manual highlighting for Figure 3)
source("code/3_fig_figure3_4.R")

  #Create Figure 5
source("code/3_fig_figure5.R")


# -----------------------------------------------------------------------------
# EXTRA
# -----------------------------------------------------------------------------





