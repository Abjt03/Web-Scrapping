library(robotstxt)
library(rvest)
library(dplyr)
library(tidyverse)

link<-"https://www.bikewale.com/best-bikes-in-india/"
path = paths_allowed(link)
web<-read_html(link)
Bike_name<- web %>%html_nodes("#divSearchResult .bw-ga")%>%html_text()
Bike_name<-Bike_name[c(FALSE, TRUE)]
View(Bike_name)
Bike_price <-web %>%html_nodes("#divSearchResult .text-bold")%>%html_text()
Bike_stats<-web %>%html_nodes("#divSearchResult .margin-bottom15")%>%html_text()
Bike_rating <-web %>%html_nodes(".rate-star-color")%>%html_text()
Bike <- data.frame(Bike_name, Bike_price, Bike_stats, Bike_rating)
View(Bike)
write.csv(Bike, 'myBikes.csv')
