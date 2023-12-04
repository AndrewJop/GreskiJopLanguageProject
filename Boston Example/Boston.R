#Noah Greski and Andrew Jop
#Fall 2023
#Boston Weather Data 2013 - 2023

install.packages("ggplot2")
library(ggplot2)

#read in csv file
data <- read.csv("Boston Example/boston_weather_data.csv")
data

#creates scatter plot
ggplot(data, aes(x = time, y = tavg)) +
  geom_point() +
  labs(title = "Temperature Trends in Boston (2013 - 2023)",
       x = "Date",
       y = "Temperature (°C)")

#converts date into date object
data$time <- as.Date(data$time, format = "%Y-%m-%d")

#converts to just year
data$year <- format(data$time, "%Y")

#creates bar chart of Total Precipitation
ggplot(data, aes(x = year, y = prcp, fill = year)) +
  geom_bar(stat = "summary", fun = "sum", position = "dodge") +
  labs(title = "Total Precipitation Yearly in Boston (2013 - 2023)",
       x = "Year",
       y = "Total Precipitation (mm)",
       fill = "Year") +
  scale_y_continuous(labels = scales::comma_format()) #better readability with commas