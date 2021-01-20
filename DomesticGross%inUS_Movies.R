movies <- read.csv(file.choose())



head(movies)
str(movies)
summary(movies)


movies_filtered <- movies[movies$Studio %in% c("Sony","Fox","Buena Vista Studios", 
                          "Paramount Pictures", "Universal",
                          "WB") & movies$Genre %in% c("animation",
                                                    "action",
                                                    "adventure",
                                                    "comedy",
                                                    "drama"),]


colnames(movies_filtered) <- c("DayofWeek","Director","Genre","MovieTitle",
                               "ReleaseDate","Studio","AdjustedGross",
                               "Budget","Gross","IMDbRating",
                               "MovieLensRating","Overseas",
                               "OverseasPercent","Profit","ProfitPercent",
                               "RuntimeMinutes","US","GrossPercentUS")

head(movies_filtered)

q <- ggplot(data=movies_filtered,aes(x=Genre,y=GrossPercentUS)) 
qx <- q + geom_jitter(aes(color=Studio, size=Budget)) + geom_boxplot(alpha=0.3) +
  ggtitle("Domestic Gross % by Genre") + ylab("Gross % US") +
  theme(plot.title = element_text(hjust = 0.5))
  
q$labels$size <- "Budget $M"

qx



