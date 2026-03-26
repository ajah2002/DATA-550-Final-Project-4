library(labelled)
library(gtsummary)
library(car)
library(here)
library(dplyr)

here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("data", "BRFSS_data.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

south_data22 <- data %>%
  filter(LocationAbbr %in% c("TX" ,"GA"),
         YearStart == 2022,
         Data_Value_Type == "Crude Prevalence")

saveRDS(
  south_data22, 
  file = here::here("output","data_clean.rds")
)

