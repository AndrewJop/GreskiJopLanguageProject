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



starbucks_sf <- st_as_sf(starbucks_data, coords = c("Longitude", "Latitude"))


starbucks_map_world <- leaflet(data = starbucks_sf ) %>%
  addTiles() %>%
  addMarkers(
    clusterOptions = markerClusterOptions(),
    popup = ~paste("<strong>Store Name:</strong> ", StoreName, "<br>",
                   "<strong>Country:</strong> ", Country, "<br>",
                   "<strong>State/Province:</strong> ", State/Province, "<br>"),
    label = ~paste(StoreName)
  )


starbucks_map_world