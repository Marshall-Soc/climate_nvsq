
# -----------------------------------------------------------------------------
# Correlation Heatmap
# -----------------------------------------------------------------------------

if(!dir.exists(file.path("figures/"))) dir.create(file.path("figures/"))

  #Lagging the engagement metrics
tweets <- tweets |>
  mutate(date = ymd(as.Date(created_at)),
         month_yr = format(date, "%Y-%m"),
         merge_id = paste0(username, month_yr))

tweets.lag <- tweets |>
  group_by(username, month_yr) |>
  summarize(mean_retweet = mean(retweet_count),
            mean_reply = mean(reply_count),
            mean_like = mean(like_count),
            mean_quote = mean(quote_count)) |>
  mutate(merge_id = paste0(username, month_yr))

tweets.lag <- pdata.frame(tweets.lag, index = c("username","month_yr"))

tweets.lag <- transform(tweets.lag, temp_month_yr = lag(month_yr, 1))
tweets.lag <- transform(tweets.lag, lag_mean_retweet = lag(mean_retweet, 1))
tweets.lag <- transform(tweets.lag, lag_mean_reply = lag(mean_reply, 1))
tweets.lag <- transform(tweets.lag, lag_mean_like = lag(mean_like, 1))
tweets.lag <- transform(tweets.lag, lag_mean_quote = lag(mean_quote, 1))
tweets.lag <- transform(tweets.lag, lag_mean_climate = lag(mean_climate, 1))

tweets.lag$temp_month_yr <- NULL
tweets.lag$username <- NULL
tweets.lag$month_yr <- NULL

tweets.lag$merge_id <- as.character(tweets.lag$merge_id)

tweets <- left_join(tweets, tweets.lag, by = "merge_id")

names(tweets) <- gsub("^V", "T", names(tweets))

  #Add user-level metrics
users <- cbind(users$id, users$public_metrics)
users <- rename(users, id = `users$id`)

    #User-level engagement metrics can change as the scrape of their profile
      #changes, so need to average
users <- users %>%
  group_by(id) %>%
  mutate(n_followers = mean(followers_count),
         n_following = mean(following_count),
         n_tweet = mean(tweet_count),
         n_listed = mean(listed_count)) %>%
  select(-c(followers_count,following_count,
            tweet_count,listed_count))

tweets <- left_join(tweets, unique(users), 
                    by = c("author_id" = "id"))

  #Correlations
tweets$Small <- ifelse(tweets$Size == 1, 1, 0)
tweets$Medium <- ifelse(tweets$Size == 2, 1, 0)
tweets$Large <- ifelse(tweets$Size == 3, 1, 0)
tweets$Regional <- ifelse(tweets$`Scope of Work` == 1, 1, 0)
tweets$National <- ifelse(tweets$`Scope of Work` == 2, 1, 0)
tweets$International <- ifelse(tweets$`Scope of Work` == 3, 1, 0)

tweets <- rename(tweets, `Year Established` = `Year of Est`,
                 `Year of Tweet` = year,
                 `Year Joined` = JoinedTwitter,
                 `Program Expenditures` = ProgExp,
                 `Admin Expenditures` = AdminExp,
                 `Lagged Mean Likes` = lag_mean_like,
                 `Lagged Mean Replies` = lag_mean_reply,
                 `Lagged Mean Retweets` = lag_mean_retweet,
                 `Lagged Mean Quote-Tweets` = lag_mean_quote,
                 `Number of Followers` = n_followers,
                 `Number Following` = n_following,
                 `Number of Tweets` = n_tweet)

vars <- c("T2","T5","T6","T8","T11","T14","T17","T20","T21","T22","T25",
          "Year Established","Year of Tweet","Year Joined",
          "Small","Medium","Large","Regional","National","International",
          "Program Expenditures","Admin Expenditures",
          "Lagged Mean Likes","Lagged Mean Replies",
          "Lagged Mean Retweets","Lagged Mean Quote-Tweets",
          "Number of Followers","Number Following","Number of Tweets")

topic.cors <- Hmisc::rcorr(as.matrix(tweets[, vars]), type = "pearson")

corr.plot <- ggcorrplot(topic.cors$r, hc.order = FALSE, type = "lower", 
                        p.mat = topic.cors$P, tl.cex = 8)

png("figures/figure5.png", width = 10, height = 10, res = 750, units = "in")
  corr.plot
dev.off()


