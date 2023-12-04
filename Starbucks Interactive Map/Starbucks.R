#Noah Greski and Andrew Jop
#Fall 2023
#Starbucks Interactive Map

install.packages("leaflet")
install.packages("dplyr")
library(leaflet)
library(dplyr)

data <- read.csv("starbucks_locations.csv")

starbucks_map <- leaflet(data = starbucks_data) %>%
  addTiles() %>%
  addMarkers(
    lng = ~Longitude,
    lat = ~Latitude,
    popup = ~paste("<strong>Name:</strong> ", Name, "<br>",
                   "<strong>City:</strong> ", City, "<br>",
                   "<strong>Country:</strong> ", Country),
    label = ~paste(Name)
  )


starbucks_map