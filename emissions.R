#Noah Greski and Andrew Jop
#Fall 2023
#Emissions Bar Chart

install.packages("ggplot2")

library(ggplot2)

#read in file
data <- read.csv("greenhouse-gas-emissions-industry-and-household-march-and-june-2023-quarters.csv")

ggplot(data, aes(x = Period, y = Data_value)) +
  geom_bar(stat = "identity", fill = "skyblue", alpha = 0.7) +
  labs(title = "Green Gas Emissions in Household 2010 to 2023", x = "Period", y = "Emissions (in Thousands of Kilotonnes)") +
  theme_minimal() +
  scale_y_continuous(labels = scales::label_number())