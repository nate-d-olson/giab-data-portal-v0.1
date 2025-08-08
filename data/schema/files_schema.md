# Canonical File Schema (initial)

Common columns (all file types)
- file_id: MD5-based identifier when available (from ftp/s3 exports); else NULL.
- file_type: fastq | bam | vcf.
- giab_id, biosample, dna_id, trio: sample identifiers.
- tech: sequencing technology when derivable (SeqSleuth or manual tables).
- ref_genome: reference genome when known.
- aligner, variant_caller: tools, when known (bam/vcf).
- file_url: public FTP URL when available; may be NULL for s3-only entries.
- filesize_gb: numeric size in gigabytes.
- source: ftp | s3 (initially), with future values: manual, seqsleuth.

Type-specific columns
- FASTQ: total_sequences, total_bases, pct_gc, mode_length, mode_quality.
- BAM: sort_order.
- VCF: failed_filters, passed_filters, snps, mnps, insertions, deletions, indels, same_as_reference, phased_genotypes.

Notes
- This schema is intentionally minimal and will be iterated. Prefer header-/tool-derived metadata over filename-derived when both exist.
- Provenance (batch_id, source_version) to be added in Phase 2.
