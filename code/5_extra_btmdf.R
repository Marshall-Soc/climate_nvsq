
# -----------------------------------------------------------------------------
# Create BTM DF
# -----------------------------------------------------------------------------

  #Special preprocessors
removeURL <- content_transformer(function(x) gsub("http[^[:space:]]*", "", x))
userNames <- content_transformer(function(x) gsub("\\B@\\w+", "", x))
removeSpecial <- content_transformer(function(x) gsub("[^\x20-\x7E]", "", x))

removeMostPunctuation <-
  content_transformer(function(x, preserve_intra_word_dashes = FALSE) 
  {
    rmpunct <- function(x) {
      x <- gsub("#", "\002", x)
      x <- gsub("[[:punct:]]+", " ", x)
      gsub("\002", "#", x, fixed = TRUE)
    }
    if (preserve_intra_word_dashes) { 
      x <- gsub("(\\w)-(\\w)", "\\1\001\\2", x)
      x <- rmpunct(x)
      gsub("\001", "-", x, fixed = TRUE)
    } else {
      rmpunct(x)
    }
  })

removeRogueTags <- content_transformer(function(x) {return(gsub("# ", "", x))})
attachHash <- content_transformer(function(x) {return(gsub("# ", "#", x))})
  #The lemmatize_strings() function separates the hashtag from its corresponding text 
    #(e.g., #hashtag becomes # hashtag). This function re-attaches the hashtags back to 
    #their texts.

  #Apply pre-corpus preprocessors
tweets.unique$text[15] #Take a look at the raw texts

    #Replace kerning
tweets.unique$text <- replace_kern(tweets.unique$text)

    #Replace contractions
tweets.unique$text <- replace_contraction(tweets.unique$text)

    #Transliterate
tweets.unique$text <- stri_trans_general(tweets.unique$text, 
                                         id = "Any-Latin; Latin-ASCII")

    #Replace curly quotes
tweets.unique$text  <- replace_curly_quote(tweets.unique$text)

    #Convert to corpus
corpus <- VCorpus(VectorSource(tweets.unique$text))

  #Apply preprocessors

    #Remove URLs
corpus <- tm_map(corpus, removeURL)

    #Remove usernames
corpus <- tm_map(corpus, userNames)

    #Remove non-ASCII characters
corpus <- tm_map(corpus, removeSpecial)

    #Remove numbers
corpus <- tm_map(corpus, removeNumbers)

    #Remove punctuation, except for hashtags
corpus <- tm_map(corpus, removeMostPunctuation)

    #Remove capitalization
corpus <- tm_map(corpus, content_transformer(tolower))

    #Remove English stop words from the Snowball list
corpus <- tm_map(corpus, removeWords, stopwords("english"))

    #Remove rogue hashtags
corpus <- tm_map(corpus, removeRogueTags)

    #Remove excess whitespace
corpus <- tm_map(corpus, stripWhitespace)

    #Lemmatize
corpus <- convert.tm.to.character(corpus)
corpus <- lemmatize_strings(corpus,
                            dictionary=lexicon::hash_lemmas)

corpus <- VCorpus(VectorSource(corpus))

    #Reattach hashtags
corpus <- tm_map(corpus, attachHash)

    #Get rid of "amp"
corpus <- tm_map(corpus, removeWords, c("amp"))

inspect(corpus[[15]]) #Make sure everything looks good


#Create DTM, remove words of length <=2, and remove sparse terms
tweets.dtm <- DocumentTermMatrix(corpus, 
                                 control = list(wordLengths = c(2, Inf)))
tweets.dtm <- removeSparseTerms(tweets.dtm, .999)

#Create BTM dataframe
btm.df <- corpus %>%
  convert.tm.to.character() %>%
  tibble() %>%
  add_column(id = tweets.unique$id) %>%
  unnest_tokens(., word, ., token = stringr::str_split, pattern = " ") %>%
  filter(word %in% colnames(tweets.dtm)) %>%
  filter(!nchar(word) <= 2) %>%
  filter(!(word %in% c("can","one")))
