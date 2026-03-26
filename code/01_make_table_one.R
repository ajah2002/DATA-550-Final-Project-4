library(tidyverse)
library(gt)

here::i_am("code/01_make_table_one.R")

data <- readRDS(
  file = here::here("output", "data_clean.rds")
)

table_data <- bind_rows(
  # Age Group
  data |> filter(Sex == "Both sexes", 
                         RaceEthnicity == "All races", 
                         RiskFactor == "All participants", 
                         Age != "18 years and older") |>
    mutate(Category = "AGE", Label = Age),
  
  # Sex
  data |> filter(Age == "18 years and older", 
                         RaceEthnicity == "All races", 
                         RiskFactor == "All participants", 
                         Sex != "Both sexes") |>
    mutate(Category = "SEX", Label = Sex),
  
  # Race/Ethnicity - Asian and Native American are blanks so I will exclude
  data |> filter(Age == "18 years and older", 
                         Sex == "Both sexes", 
                         RiskFactor == "All participants", 
                         RaceEthnicity %in% c("White, non-Hispanic", 
                                              "Black, non-Hispanic", 
                                              "Hispanic, any race")) |>
    mutate(Category = "RACE/ETHNICITY", Label = RaceEthnicity),
)

# Using features in GT package
table_one <- table_data |>
  select(Category, Label, LocationAbbr, Data_Value) |>
  pivot_wider(names_from = LocationAbbr, values_from = Data_Value) |>
  group_by(Category) |>
  gt() |>
  cols_label(Label = "Characteristic", TX = "Texas (%)", GA = "Georgia (%)") |>
  fmt_missing(columns = everything(), missing_text = "")

saveRDS(
  table_one, 
  file = here::here("output","table_one.rds")
)