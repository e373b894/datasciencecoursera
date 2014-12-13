library(tm)
library(wordcloud)
library(memoise)

# The list of datasets
datasets <<- list("wichita state tweets" = "go_shockers",
               "pink slime tweets" = "ps_tweets3")

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(dataset) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  if (!(dataset %in% datasets))
    stop("Unknown set")
  
#  text <- readLines(sprintf(dataset),encoding="UTF-8")
    text <- readLines(dataset)
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,stopwords("english"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})