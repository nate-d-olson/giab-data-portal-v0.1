#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(tidyverse)
  library(here)
  library(fs)
  library(glue)
})

indir  <- here("data/derived/ingest")
outdir <- here("data/derived")
dir_create(outdir)

dat <- read_rds(path(indir, "ingested.rds"))

build_ftp_url <- function(filepath, filename) {
  if (is.na(filepath) || is.na(filename)) return(NA_character_)
  rel <- str_remove(filepath, "^/giab/ftp/")
  glue("https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/{rel}/{filename}")
}

# FASTQ
fastq <- dat$fastq_meta %>%
  mutate(file_type = "fastq") %>%
  left_join(select(dat$ftp, md5key, filepath, filename, filetype) %>% mutate(source = "ftp"),
            by = c("filepath","filename")) %>%
  bind_rows(
    dat$fastq_meta %>%
      left_join(select(dat$s3, md5key, filepath, filename, filetype) %>% mutate(source = "s3"),
                by = c("filepath","filename")) %>%
      filter(!is.na(md5key))
  ) %>%
  mutate(file_url = if_else(source == "ftp", build_ftp_url(filepath, filename), NA_character_),
         tech = NA_character_) %>%
  { if (!is.null(dat$full_fq)) left_join(., dat$full_fq %>% rename(filename_full = filename), by = c("filename" = "filename_full")) else . } %>%
  mutate(tech = coalesce(tech, predicted_tech)) %>%
  select(
    file_id = md5key, file_type,
    giab_id, biosample, dna_id, trio, tech,
    ref_genome = NULL, aligner = NULL, variant_caller = NULL,
    file_url, filesize_gb = filesize_in_Gb, source,
    total_sequences, total_bases, pct_gc, mode_length, mode_quality
  )

# BAM
bam <- dat$bam_meta %>%
  mutate(file_type = "bam") %>%
  rename(filename = bam) %>%
  left_join(select(dat$ftp, md5key, filepath, filename, filetype) %>% mutate(source = "ftp"),
            by = c("filepath","filename")) %>%
  bind_rows(
    dat$bam_meta %>% rename(filename = bam) %>%
      left_join(select(dat$s3, md5key, filepath, filename, filetype) %>% mutate(source = "s3"),
                by = c("filepath","filename")) %>%
      filter(!is.na(md5key))
  ) %>%
  mutate(file_url = if_else(source == "ftp", build_ftp_url(filepath, filename), NA_character_)) %>%
  select(
    file_id = md5key, file_type,
    giab_id, biosample, dna_id, trio,
    tech = NULL,
    ref_genome = reference_genome,
    aligner, variant_caller = NULL,
    file_url, filesize_gb = filesize_in_Gb, source,
    sort_order
  )

# VCF
vcf <- dat$vcf_meta %>%
  mutate(file_type = "vcf",
         filename = basename(location)) %>%
  left_join(select(dat$ftp, md5key, filepath, filename, filetype) %>% mutate(source = "ftp"),
            by = c("filepath","filename")) %>%
  bind_rows(
    dat$vcf_meta %>% mutate(filename = basename(location)) %>%
      left_join(select(dat$s3, md5key, filepath, filename, filetype) %>% mutate(source = "s3"),
                by = c("filepath","filename")) %>%
      filter(!is.na(md5key))
  ) %>%
  mutate(file_url = if_else(source == "ftp", build_ftp_url(filepath, filename), NA_character_)) %>%
  { if (!is.null(dat$vcf_url)) left_join(., dat$vcf_url %>% rename(tech = sequencing_technology, sample_id = sample_id, ref_genome_url = ref_genome) %>% select(-date),
                                         by = c("giab_id" = "sample_id"), keep = FALSE) else . } %>%
  mutate(ref_genome = coalesce(ref_genome, ref_genome_url)) %>%
  select(
    file_id = md5key, file_type,
    giab_id, biosample, dna_id, trio, tech,
    ref_genome,
    aligner = NULL, variant_caller = NULL,
    file_url, filesize_gb = filesize_in_Gb, source,
    failed_filters, passed_filters, snps, mnps, insertions, deletions, indels,
    same_as_reference, phased_genotypes
  )

# Bind master table
files <- bind_rows(
  fastq %>% select(file_id, file_type, giab_id, biosample, dna_id, trio, tech, ref_genome, aligner, variant_caller, file_url, filesize_gb, source),
  bam   %>% select(file_id, file_type, giab_id, biosample, dna_id, trio, tech, ref_genome, aligner, variant_caller, file_url, filesize_gb, source),
  vcf   %>% select(file_id, file_type, giab_id, biosample, dna_id, trio, tech, ref_genome, aligner, variant_caller, file_url, filesize_gb, source)
) %>% distinct()

write_csv(fastq, path(outdir, "fastq.csv"))
write_csv(bam,   path(outdir, "bam.csv"))
write_csv(vcf,   path(outdir, "vcf.csv"))
write_csv(files, path(outdir, "files.csv"))

message("Transform complete -> ", path_abs(outdir))

