#Noah Greski and Andrew Jop
#Fall 2023
#Starbucks Interactive Map

install.packages("leaflet")
install.packages("dplyr")
install.packages("sf")
library(leaflet)
library(dplyr)
library(sf)

starbucks_data <- read.csv("Starbucks Interactive Map/starbucks_locations.csv")

starbucks_data <- starbucks_data %>%
  filter(!is.na(Longitude) & !is.na(Latitude))

starbucks_data <- starbucks_data %>%
  filter(!is.na(Longitude) & !is.na(Latitude))


starbucks_sf <- st_as_sf(starbucks_data, coords = c("Longitude", "Latitude"))


starbucks_map_world <- leaflet(data = starbucks_sf ) %>%
  addTiles() %>%
  addMarkers(
    clusterOptions = markerClusterOptions(),
    popup = ~paste("<strong>Name:</strong> ", Brand, "<br>",
                   "<strong>City:</strong> ", City, "<br>",
                   "<strong>Country:</strong> ", Country),
    label = ~paste(Brand)
  )


starbucks_map_world