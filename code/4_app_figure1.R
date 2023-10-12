
# -----------------------------------------------------------------------------
# Appendix 1 Figure
# -----------------------------------------------------------------------------

if(!dir.exists(file.path("figures/"))) dir.create(file.path("figures/"))

  #Load in functions for diagnostic statistics
source("code/diagnostics_functions.R")

  # Get DTM for semantic coherence -- You need the BTM dataframe for this,
      #which you can generate from 5_extra_btmdf.R after you've rehydrated
      #the raw texts from the tweets
DTM <- btm.df |>
  count(id, word) |>
  cast_dtm(id, word, n)

  # Get semantic coherence and exclusivity
k <- list(climate.topics.btm.5,
          climate.topics.btm.7,
          climate.topics.btm.9,
          climate.topics.btm.10,
          climate.topics.btm.15,
          climate.topics.btm.17,
          climate.topics.btm.20,
          climate.topics.btm.25)
sc <- matrix(nrow = length(k), ncol = 2) %>% as.data.frame()
sc$names <- c(5,7,9,10,15,17,20,25)

for (i in 1:length(k)) {
  sc[i,1] <- coherenceBTM(k[[i]], DTM, N = 30) %>%
    mean()
  
  sc[i,2] <- exclusivity(k[[i]], M = 30)
}

  #Plot them
diagnostics <- ggplot(sc, aes(x = V1, y = V2)) +
  geom_text(aes(label = names), size = 2) +
  xlab("Semantic Coherence") +
  ylab("Exclusivity") +
  theme_bw() +
  theme(axis.title = element_text(face = "bold"))

png("figures/app_figure1.png", res = 750, width = 6, height = 4, units = "in")
  diagnostics
dev.off()
