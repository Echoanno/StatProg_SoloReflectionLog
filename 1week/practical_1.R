install.packages("palmerpenguins")
library(palmerpenguins)
library(dplyr)
library(ggplot2)
data(package = "palmerpenguins")
head(penguins)
adelie_plot <- penguins %>% 
  filter(species == "Adelie") %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  labs(title = "Bill Length vs. Bill Depth for Adelie Penguins",
       x = "Bill Length (mm)",
       y = "Bill Depth (mm)"
       )
adelie_plot
library(tidyverse)
print(adelie_plot)
penguins %>% 
  group_by(species) %>% 
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            median_bill_length = median(bill_length_mm,na.rm = TRUE),
            sd_bill_length = sd(bill_length_mm, na.rm = TRUE))
penguins %>% 
  pivot_longer(cols = c(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g),
               names_to = "feature",
               values_to = "value") %>% 
  ggplot(aes(x = species, y = value)) +
  geom_boxplot() +
  facet_wrap(~ feature, scales = "free_y") +
  labs(title = "Boxplots of Penguin Features by Species",
       x = "Species",
       y = "Value")
