ETL_R = R -q -e

.PHONY: etl render site clean

etl:
	$(ETL_R) 'source("scripts/01_ingest.R"); source("scripts/02_transform.R"); source("scripts/03_validate.R")'

render:
	quarto render

site: etl render

clean:
	rm -rf docs/* data/derived/*.csv data/derived/validation_report.md data/derived/ingest
