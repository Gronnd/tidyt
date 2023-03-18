#carga paquetes
library(tidyverse)
library(tidytuesdayR)
library(skimr)


#descarga datos
tidytuesdayR::tt_available()
tuesdata <- tt_load(2023, week = 7)


#exploración de datos
agegaps <- tuesdata$age_gaps

skimr::skim(agegaps)

#plot the distribution of the age gaps
ggplot(agegaps, aes(x = age_difference)) +
  geom_histogram(bins = 30) +
  labs(title = "Distribution of Age Gaps",
       x = "Age Gap",
       y = "Count")

#plot the distribution of the age gaps with x axis as log-normal scale
ggplot(agegaps, aes(x = age_difference)) +
  geom_histogram(bins = 30) +
  labs(title = "Distribution of Age Gaps",
       x = "Age Gap",
       y = "Count") +
  scale_x_log10()


#plot the relation between age gap and release year
ggplot(agegaps, aes(x = release_year, y = age_difference)) +
  geom_point() +
  labs(title = "Age Gap vs Release Year",
       x = "Release Year",
       y = "Age Gap")
#same plot but with a linear regression line
ggplot(agegaps, aes(x = release_year, y = age_difference)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Age Gap vs Release Year",
       x = "Release Year",
       y = "Age Gap")



agegaps %>% 
count(character_1_gender, character_2_gender)



