#Noah Greski and Andrew Jop
#Fall 2023
#Starbucks Interactive Map

#installing the neccessary packages
install.packages("leaflet")
install.packages("dplyr")
install.packages("sf")

#loading the correct packages
library(leaflet)
library(dplyr)
library(sf)

#reading in the starbucks world locations data from the CSV file
starbucks_data <- read.csv("Starbucks Interactive Map/starbucks_locations.csv")

#filtering out rows that have no coordinates in them in the dataset
starbucks_data <- starbucks_data %>%
  filter(!is.na(Longitude) & !is.na(Latitude))

#converting the data to an sf object for spatial indexing (makes the map run better)
starbucks_sf <- st_as_sf(starbucks_data, coords = c("Longitude", "Latitude"))

#creates the world map with locations
starbucks_map_world <- leaflet(data = starbucks_sf ) %>%
  addTiles() %>%
  addMarkers(
    clusterOptions = markerClusterOptions(), #makes not every data point show so the map runs better
    
    #these are the pop ups when clicking on a data point on the map showing information for each
    popup = ~paste("<strong>Store Name:</strong> ", StoreName, "<br>",
                   "<strong>Brand:</strong> ", Brand, "<br>",
                   "<strong>Store Number:</strong> ", StoreNumber, "<br>",
                   "<strong>Street Address:</strong> ", StreetAddress, "<br>",
                   "<strong>City:</strong> ", City, "<br>",
                   "<strong>State/Province:</strong> ", StateProvince, "<br>",
                   "<strong>Country:</strong> ", Country, "<br>",
                   "<strong>Postcode:</strong> ", Postcode, "<br>",
                   "<strong>Phone Number:</strong> ", PhoneNumber, "<br>",
                   "<strong>Timezone:</strong> ", Timezone),
    label = ~paste(StoreName)
  )

#runs the interactive map
starbucks_map_world