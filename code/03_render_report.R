library(rmarkdown)

here::i_am("code/03_render_report.R")

rmarkdown::render(
  input = here::here("Final_Proj_2_RMarkdown.Rmd"),
  output_file = here::here("Final_Project_2_report.html")
)