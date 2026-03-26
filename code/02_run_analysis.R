library(dplyr)
library(ggplot2)
library(ggeffects)

here::i_am("code/02_run_analysis.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

risk_data <- data |> filter(Age == "18 years and older", 
                                    Sex == "Both sexes", 
                                    RaceEthnicity == "All races", 
                                    RiskFactor %in% c("Diabetes", "Smoking"), 
                                    RiskFactorResponse == "Yes")

model <- lm(Data_Value ~ RiskFactor + LocationAbbr, data = risk_data)

pred <- ggpredict(model, terms = c("RiskFactor", "LocationAbbr"))

plot <- ggplot(pred, aes(x = x, y = predicted, color = group)) +
  geom_point(size = 3) +
  labs(
    x = "Risk Factor",
    y = "Predicted Prevalence (%)",
    title = "Predicted Prevalence of Visual Impairment by Risk Factor"
  )

saveRDS(
  model, 
  file = here::here("output","model.rds")
)

saveRDS(
  pred, 
  file = here::here("output","prediction.rds")
)

ggsave(
  here::here("output/scatterplot.png"),
  plot = plot,
  device = 'png'
)
