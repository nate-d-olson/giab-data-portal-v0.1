# Repository Guidelines

These guidelines help contributors work consistently in this R-based data portal project.

## MVP Plan & Publishing
- Goal: a browsable GIAB RM metadata portal with search/filter and links to FASTQ/BAM/VCF on FTP/S3; clear data dictionaries and provenance.
- Publishing: build a Quarto website and publish via GitHub Pages (quarto render; GitHub Actions deploy). Keep data/derived/ CSVs versioned and referenced by the site.
- Phase 1 (this repo only):
  1) Canonical schema: unify columns across file types (giab_id, biosample, dna_id, trio, tech, ref_genome, aligner/variant_caller, file_url, filesize_gb, md5key, source; plus type-specific stats).
  2) ETL: scripts/01_ingest.R, 02_transform.R, 03_validate.R to read raw-data/, harmonize, dedupe, and validate. Emit data/derived/{fastq,bam,vcf,files}.csv and a validation report.
  3) Site: Quarto pages for Overview, FASTQ/BAM/VCF tables, Data Dictionaries, and Methods. Use interactive tables where feasible.
  4) CI: action to restore renv, run ETL, render site, and publish.
- Phase 2 (integrations): add Athena/CDK exports, SeqSleuth header parsing, and Google Sheets ingestion with service account; add provenance/versioning and a data quality dashboard.

## Project Structure & Module Organization
- notebooks/: Quarto (.qmd) and R Markdown (.Rmd) notebooks for data parsing and cleaning.
- metadata_tables/: Curated CSV/TSV files and their data dictionaries (.data_dictionary.md).
- raw-data/: Source CSV/TSV/JSON files and per-dataset data dictionaries; includes manually_generated_tables/.
- renv/: R dependency management (see renv.lock). Use the provided .Rproj to open in RStudio.
- get_manually_generated_sheets.html (+ _files/): Rendered artifact from a notebook.

## Build, Test, and Development Commands
- Restore R packages (once per environment):
  - R -q -e 'renv::restore()'
- Render Quarto notebooks (.qmd):
  - quarto render notebooks/data-cleaning.qmd
- Render R Markdown (.Rmd):
  - Rscript -e 'rmarkdown::render("notebooks/parse_ftp_csv.Rmd")'
- Open interactively via RStudio: giab-data-portal-v0.1.Rproj

## Coding Style & Naming Conventions
- Language: R (tidyverse-friendly). Indentation: 2 spaces; line width ~100.
- Filenames and columns: lower_snake_case; data dictionary files end with .data_dictionary.md.
- Prefer relative paths (e.g., here::here("raw-data","fastq_metadata.csv")); avoid absolute/user-specific paths.
- Set seeds in notebooks when sampling to ensure reproducibility.

## Testing Guidelines
- No formal unit tests yet. Validate by rendering notebooks without errors and checking outputs.
- Sanity checks (examples):
  - R -q -e 'readr::read_csv("raw-data/fastq_metadata.csv", n_max=5)'
  - Confirm columns match corresponding data dictionaries in metadata_tables/ or raw-data/.

## Commit & Pull Request Guidelines
- History shows brief messages; please use clear, descriptive, imperative messages (e.g., "Add fastq parser for ONT").
- Prefer conventional prefixes when helpful: feat, fix, docs, data, refactor.
- PRs should include: purpose/summary, datasets or notebooks touched, before/after notes or sample rows, and linked issues.

## Security & Data Tips
- Do not commit secrets or credentials; this repo should only contain public data and code.
- Large raw artifacts should be referenced by source and documented, not duplicated, when feasible.
