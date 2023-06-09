Raw metadata tables downloaded from AWS Athena using the console on 4/19/23

Data dictionaries generated using the first ten rows of the metadata tables as a prompt for chatGPT, then edited by ND Olson. 

## Directory Structure/ File List

File list from 6/14/2023
```
.
├── README.md
├── bam_metadata.csv: Exported from Athena database, combined metadata for bam files from ftp.csv, s3.csv, and vcfstats.csv
├── bam_metadata.data_dictionary.md
├── bamstats.csv: summary statistics for bam files generated using samtools idxstats
├── error_fastq.csv: Error logs for fastqc 
├── fastq_metadata.csv: Exported from Athena database, combined metadata for fastq files from ftp.csv, s3.csv, and vcfstats.csv 
├── fastq_metadata.data_dictionary.md
├── fastqstats.csv: summary statistics generated using fastqc for Illumina and PacBio reads, pycoQC for ONT reads (TODO)
├── ftp.csv: list of fastq, bam, and vcf files on the GIAB FTP site with basic metadata extracted from the filenames
├── ftp.data_dictionary.md
├── full_bam_metadata.json.gz: metadata extracted from bam headers
├── full_fq_metadata.csv: metadata extracted from read names
├── full_fq_metadata.data_dictionary.md
├── full_vcf_metadata.json: metadata extracted from VCF headers
├── full_vcf_url_metadata.csv: metadata extracted from filenames and paths
├── full_vcf_url_metadata.data-dictionary.md
├── manually_generated_tables
│   ├── ill
│   │   ├── Data Descriptor.tsv
│   │   ├── ILL_alignments.tsv
│   │   ├── ILL_basecalls.tsv
│   │   ├── ILL_variants.tsv
│   │   └── sample_table.tsv
│   ├── ont
│   │   ├── Data Descriptor.tsv
│   │   ├── ONT_alignments.tsv
│   │   ├── ONT_basecalls.tsv
│   │   ├── ONT_raw.tsv
│   │   ├── ONT_variants.tsv
│   │   └── sample_table.tsv
│   └── pacbioccs
│       ├── Data Descriptor.tsv
│       ├── PacBioCCS_alignments.tsv
│       ├── PacBioCCS_basecalls.tsv
│       ├── PacBioCCS_variants.tsv
│       └── sample_table.tsv
├── s3.csv: list of fastq, bam, and vcf files on the HPRC S3 bucket with basic metadata extracted from filenames
├── vcf_metadata.csv: Exported from Athena database, combined metadata for vcf files from ftp.csv, s3.csv, and vcfstats.csv
├── vcf_metadata.data_dictionary.md
└── vcfstats.csv: summary statistics for vcf files generated using 
```

## File Sources

- Data Dictionaries
    - data dictionaries for the individual files are/ will be provided where `data_dictionary.md` replaces the file extension, except for json files where schemas are / will be provided.

- `manually_generated_tables`: tables downloaded from google drive using `notebooks/get_manually_generated_sheets.qmd`. These are the metadata tables that were manually generated by members of the NIST-GIAB team. Notably Sierra Miller and Lindsay Harris should be credited for doing most of this work.
- `bam_metadata.csv`, `bamstats.csv`, `error_fastq.csv`, `fastq_metadata.csv`, `fastqstats.csv`, `ftp.csv`, `s3.csv`, `vcf_metadata.csv`, and `vcfstats.csv`: generated using AWS data registry cdk stack and exported from the Athena database generated by the stack.
- `full_bam_metadata.json.gz`, `full_fq_metadta.csv`, `full_vcf_metadata.json`, and `full_vcf_url_metadata.csv` were generated using SeqSleuth (https://github.com/nate-d-olson/SeqSleuth - WIP)