# taken from example on https://www.rplumber.io/

#* @get /
function(){
   status <- 200
  message <- 'Hello World'
  install.packages("ggplot2")
  install.packages("syuzhet")
  library(ggplot2)
  library(syuzhet)
  texts=readLines("test.txt")
  sentiment=get_nrc_sentiment(texts)
  text=cbind(texts,sentiment)
  TotalSentiment=data.frame(colSums(text[,c(2:11)]))
  names(TotalSentiment)="count"
  TotalSentiment=cbind("sentiment" = rownames(TotalSentiment),TotalSentiment)
  rownames(TotalSentiment)=NULL
  ggplot(data=TotalSentiment, aes(x = sentiment, y = count)) + geom_bar(aes(fill=sentiment), stat="identity") + theme(legend.position="none") + xlab("sentiment") + ylab("Total Count") + ggtitle("Total Sentiment Score")
  ggsave("filename1.jpg", width = 20, height = 20, units = "cm",path = "./public")
  list(
    status = 200,
    data = list(
      message = (as.numeric(2) + as.numeric(6))
    )
  )
}