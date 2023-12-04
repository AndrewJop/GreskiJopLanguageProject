#Noah Greski and Andrew Jop
#Fall 2023
#Chipotle Data Map Example

#installs packages needed
install.packages(c("ggplot2", "sf", "dplyr", "maps"))

#loads libraries
library(ggplot2)
library(sf)
library(dplyr)
library(maps)

#reads in csv file with Chipotle Locations
data <- read.csv("chipotle_stores.csv")

#creates an sf object with longitude and latitude
sf_data <- st_as_sf(data, coords = c("longitude", "latitude"), crs = 4326)

#gets the US Map
us_states <- map_data("state")

#creates US Map with all locations from from the data plotted on the map
ggplot() +
  geom_polygon(data = us_states, aes(x = long, y = lat, group = group), fill = "lightgrey", color = "black", size = 0.5) +
  geom_sf(data = sf_data, aes(geometry = geometry), color = "red", size = 2) +
  labs(title = "US Map with Chipotle Locations") +
  theme_minimal()
