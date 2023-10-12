
# -----------------------------------------------------------------------------
# Generate topics
# -----------------------------------------------------------------------------

  #un BTM
k <- c(5,7,9,10,15,17,20,25)

for (i in k) {
  assign(paste0("climate.topics.btm.", i),
         BTM(btm.df,
             k = i,
             beta = 0.01,
             iter = 1000,
             window = 15,
             trace = T))
}

tweet.topics.btm.5 <- predict(climate.topics.btm.5, newdata = btm.df)
tweet.topics.btm.7 <- predict(climate.topics.btm.7, newdata = btm.df)
tweet.topics.btm.9 <- predict(climate.topics.btm.9, newdata = btm.df)
tweet.topics.btm.10 <- predict(climate.topics.btm.10, newdata = btm.df)
tweet.topics.btm.15 <- predict(climate.topics.btm.15, newdata = btm.df)
tweet.topics.btm.17 <- predict(climate.topics.btm.17, newdata = btm.df)
tweet.topics.btm.20 <- predict(climate.topics.btm.20, newdata = btm.df)
tweet.topics.btm.25 <- predict(climate.topics.btm.25, newdata = btm.df)
