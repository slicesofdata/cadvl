################################################################
# Script Name: data_cleaning.R
# Author: Jane Doe
# Date Created: 2024-08-26
#
# Purpose: This script performs data cleaning operations on the
#          raw dataset, including handling missing values,
#          removing duplicates, and normalizing data columns.
################################################################

################################################################
# Note: When sourcing script files, if you do not want objects
# available in this script, use the source() function along with 
the local = TRUE argument. By default, source() will make objects
available in the current environment.

################################################################
# Load necessary libraries/source any function directories
library(dplyr)

################################################################
# Load the raw data
raw_data <- read.csv("raw_dataset.csv")

################################################################
# Remove duplicates
cleaned_data <- raw_data %>%
  distinct()

################################################################
# Handle missing values by removing rows with NA
cleaned_data <- cleaned_data %>%
  na.omit()

################################################################
# Normalize numeric columns (example)
cleaned_data <- cleaned_data %>%
  mutate(across(where(is.numeric), ~scale(.) %>% as.numeric))

################################################################
# Save the cleaned data
write.csv(cleaned_data, "cleaned_dataset.csv", row.names = FALSE)

################################################################
# End of script