FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /final
WORKDIR /final

RUN mkdir code
RUN mkdir output
COPY data data
COPY code code
COPY Makefile .
COPY Final_Proj_2_RMarkdown.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN mkdir final_report

CMD make && mv Final_Project_2_report.html final_report



