# Exercise 1: Using the LLM deliberately
library(palmerpenguins)
library(dplyr)

mean_mass_by <- function(data, group_var) {
  data |>
    group_by({{ group_var }}) |>
    #{{ }} allows tidyverse functions to correctly interpret function arguments as column names.
    summarise(mean_mass = mean(body_mass_g, na.rm = TRUE))
}

mean_mass_by(penguins, species)
# I expect this function to:
# group the data by the given variable (e.g. species)
# and compute the mean body mass for each group

# Potential issue:
# group_by(group_var) might not correctly interpret group_var
# as a column name in the dataset

# Exercise 2: Locating errors in R code
library(palmerpenguins)
library(dplyr)

summarise_species <- function(data) {
  data |>
    group_by(species) |>
    summarise(mean_mass = mean_body_mass(body_mass_g))
}

mean_body_mass <- function(x) {
  mean(x, na.rm = TRUE)   
}

summarise_species(penguins)

# Exercise 3: browser()

my_factorial <- function(n) {
  stopifnot(n >= 0, n == as.integer(n))
  if (n == 1) return(1)
  return(n * my_factorial(n - 1))
}
my_factorial(0)
my_factorial(5)   # returns 120 — correct
my_factorial(0)   # hangs / errors
my_factorial(3.5) # also wrong

# Exercise 4: debug() and debugonce()

standardise <- function(x) {
  (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
}

standardise(c(1, 2, 3, 4, 5))   # fine
standardise(c(1, 2, NA, 4, 5))  # returns all NAs — why?
# The bug occurs because mean() and sd() propagate NA values by default.
# I would prefer `debug()` when a function is called repeatedly 
# and I need to inspect its behaviour across multiple inputs or iterations. 
# For example, when debugging a recursive function or a loop where the bug does not occur consistently

# Exercise 5: Debugging Quarto