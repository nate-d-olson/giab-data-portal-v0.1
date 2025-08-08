#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(tidyverse)
  library(here)
  library(fs)
})

outdir <- here("data/derived")
dir_create(outdir)

exists_csv <- function(x) file_exists(here(x))

fastq <- if (exists_csv("data/derived/fastq.csv")) read_csv(here("data/derived/fastq.csv"), show_col_types = FALSE) else NULL
bam   <- if (exists_csv("data/derived/bam.csv"))   read_csv(here("data/derived/bam.csv"),   show_col_types = FALSE) else NULL
vcf   <- if (exists_csv("data/derived/vcf.csv"))   read_csv(here("data/derived/vcf.csv"),   show_col_types = FALSE) else NULL
files <- if (exists_csv("data/derived/files.csv")) read_csv(here("data/derived/files.csv"), show_col_types = FALSE) else NULL

checks <- list()

summ <- function(df, name) {
  tibble(
    table = name,
    n_rows = nrow(df),
    n_missing_giab_id = sum(is.na(df$giab_id)),
    n_missing_urls = sum(is.na(df$file_url))
  )
}

if (!is.null(fastq)) checks[["fastq"]] <- summ(fastq, "fastq")
if (!is.null(bam))   checks[["bam"]]   <- summ(bam,   "bam")
if (!is.null(vcf))   checks[["vcf"]]   <- summ(vcf,   "vcf")
if (!is.null(files)) checks[["files"]] <- summ(files, "files")

report <- bind_rows(checks)

readme <- c(
  "# Validation Report",
  paste0("Generated: ", Sys.time()),
  "",
  "Summary by table:",
  "",
  paste(knitr::kable(report, format = "markdown"), collapse = "\n")
)

write_lines(readme, here("data/derived/validation_report.md"))
message("Validation report -> ", path_abs(here("data/derived/validation_report.md")))

