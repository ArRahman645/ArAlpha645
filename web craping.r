library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

url<-"https://www.flipkart.com/sports/cricket/cricket-bat/english-willow~willow-type/pr?sid=abc%2C5lf%2Cp8v&p%5B%5D=facets.age_group%255B%255D%3D15%252B%2BYrs&p%5B%5D=facets.rating%255B%255D%3D4%25E2%2598%2585%2B%2526%2Babove&p%5B%5D=facets.willow_type%255B%255D%3DEnglish%2BWillow"

path<-paths_allowed(url)

web<-read_html(url)

BatName<-web%>%html_nodes(".s1Q9rs")%>%html_text()
View(BatName)

Ratings<-web%>%html_nodes("._3LWZlK")%>%html_text()
View(Ratings)

AmountWithDiscount<-web%>%html_nodes("._25b18c")%>%html_text()
View(AmountWithDiscount)

Delivery<-web%>%html_nodes("._2hu4Aw ._2Tpdn3")%>%html_text()
View(Delivery)

Bat.Details<-data.frame(BatName,Ratings,AmountWithDiscount,Delivery)
View(Bat.Details)

write.csv(Bat.Details,"ENGLISH WILLOW BAT DETAILS.csv")