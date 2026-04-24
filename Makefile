#R_LIBS_USER := C:/Users/alyss/AppData/Local/R/win-library/4.5 
#export R_LIBS_USER

Final_Project_2_report.html: Final_Proj_2_RMarkdown.Rmd code/03_render_report.R clean_data making_table1 running_analysis
	Rscript code/03_render_report.R

clean_data:
	Rscript code/00_clean_data.R

making_table1:
	Rscript code/01_make_table_one.R

running_analysis:
	Rscript code/02_run_analysis.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

project_final:
	docker build -t ajah2002/project_final .
	
final_report/Final_Project_2_report.html: project_final
	@if [ "$$(uname)" = "Darwin" ]; then \
		docker run -v "$$(pwd)/final_report":/final/final_report ajah2002/project_final; \
	else \
		docker run -v "/$$(pwd)/final_report":/final/final_report ajah2002/project_final; \
	fi