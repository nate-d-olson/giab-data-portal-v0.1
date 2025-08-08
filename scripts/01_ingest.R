#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(tidyverse)
  library(here)
  library(jsonlite)
  library(fs)
})

outdir <- here("data/derived/ingest")
dir_create(outdir)

# Core sources
ftp <- read_csv(here("raw-data/ftp.csv"), show_col_types = FALSE)
s3  <- read_csv(here("raw-data/s3.csv"), show_col_types = FALSE)

fastq_meta <- read_csv(here("raw-data/fastq_metadata.csv"), show_col_types = FALSE)
bam_meta   <- read_csv(here("raw-data/bam_metadata.csv"), show_col_types = FALSE)
vcf_meta   <- read_csv(here("raw-data/vcf_metadata.csv"), show_col_types = FALSE)

# SeqSleuth outputs (optional)
full_fq   <- suppressWarnings(read_csv(here("raw-data/full_fq_metadata.csv"), show_col_types = FALSE))
full_bam  <- tryCatch({
  fromJSON(gzfile(here("raw-data/full_bam_metadata.json.gz")))
}, error = function(e) NULL)
full_vcf  <- tryCatch({
  fromJSON(here("raw-data/full_vcf_metadata.json"))
}, error = function(e) NULL)
vcf_url   <- suppressWarnings(read_csv(here("raw-data/full_vcf_url_metadata.csv"), show_col_types = FALSE))

# Manually generated tables
mg_align_paths <- dir_ls(here("raw-data/manually_generated_tables"),
                         recurse = TRUE, regexp = "alignments.*\\.tsv$")
mg_var_paths   <- dir_ls(here("raw-data/manually_generated_tables"),
                         recurse = TRUE, regexp = "variants.*\\.tsv$")

mg_align <- if (length(mg_align_paths)) {
  map_dfr(mg_align_paths, ~ read_tsv(.x, show_col_types = FALSE), .id = "_src")
} else NULL

mg_variants <- if (length(mg_var_paths)) {
  map_dfr(mg_var_paths, ~ read_tsv(.x, show_col_types = FALSE), .id = "_src")
} else NULL

# Save for downstream scripts
write_rds(list(ftp = ftp, s3 = s3,
               fastq_meta = fastq_meta, bam_meta = bam_meta, vcf_meta = vcf_meta,
               full_fq = full_fq, full_bam = full_bam, full_vcf = full_vcf, vcf_url = vcf_url,
               mg_align = mg_align, mg_variants = mg_variants),
          file = path(outdir, "ingested.rds"))

message("Ingest complete -> ", path_abs(path(outdir, "ingested.rds")))

