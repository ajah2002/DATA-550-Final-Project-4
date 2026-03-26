## DATA 550 Final Project 2 R Markdown

## Contents and Structure of Repository

This file contains information on the data, scripts, and analysis for the DATA 550 Final Project.
The final deliverable is a report called `Final_Project_2_report.html`.

### Data and Analysis Plan
Data from the Behavioral Risk Factor Surveillance System, collected from 2013-2022 (n = 40k) is used. 
The survey collects basic information on U.S. residents' health-related risk behaviors, chronic health conditions, 
and use of preventive services. In particular, the data focuses on the surveillance of
vision and eye health and is stratified by several combinations of age group,
race/ethnicity, sex, risk factors, and state.This project looks at 2022 data in Texas and Georgia. 

First Aim: Investigate whether the crude prevalence of vision impairment differ by age, sex, and race/ethnicity in the two states. 
Second Aim: Explore whether the predicted prevalence of vision impairment is higher among individuals with different chronic disease risk factors, and the difference in both states.

The raw dataset (BRFSS_data.csv) is stored in the 'data' folder.

### Initial code description
`code/00_make_clean_data.R`
  - This loads and reads the raw data and filters it to include contents from TX and GA for 2022
  - Saves the filtered and clean data as a `.rds` object in the `output/` folder

`code/01_make_table_one.R`
  - Gathers info for Age, Sex, Race/Ethnicity characteristics and reports % for TX and GA
  - Saves table_one data as a `.rds` object in the `output/` folder

`code/02_run_analysis.R`
  - Creates a smaller data set to include all adults, sexes, racial/ethnic groups, and present risk factors for diabetes and smoking
  - Fits a linear model predicting prevalence of visual impairment by state with risk factors as the predictors
  - Calculates predicted values from the linear model and plots the values for each risk factor, colored by state
  - Saves model and prediction data as `.rds` objects in the `output/` folder
  - Saves scatterplot data as a `.png` object in the `output/` folder

`code/03_render_report.R`
  - renders `Final_Proj_RMarkdown.Rmd` as an `.html` report called `Final_Project_2_report.html`

### Generating report and brief description of contents of report
To generate the report, open a terminal (bash) and run the `make` command: 
This will automatically clean and filter the raw data, generate a summary table, run a linear model, generate a figure, 
and render the final report.

`Final_Project_2_report.html`
  - The final report includes a summary table of baseline characteristics (Table 1) and a scatterplot (Figure 1)
  displaying the predicted prevalence of vision impairment by risk factor: diabetes and smoking, and state: TX and GA.


