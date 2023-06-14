Raw metadata tables downloaded from AWS Athena using the console on 4/19/23

Data dictionaries generated using the first ten rows of the metadata tables as a prompt for chatGPT, then edited by ND Olson. 

## Directory Structure/ File List

File list from 6/14/2023
```
.
├── README.md
├── bam_metadata.csv
├── bam_metadata.data_dictionary.md
├── bamstats.csv
├── error_fastq.csv
├── fastq_metadata.csv
├── fastq_metadata.data_dictionary.md
├── fastqstats.csv
├── ftp.csv
├── ftp.data_dictionary.md
├── full_bam_metadata.json.gz
├── full_fq_metadata.csv
├── full_fq_metadata.data_dictionary.md
├── full_vcf_metadata.json
├── full_vcf_url_metadata.csv
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
├── s3.csv
├── vcf_metadata.csv
├── vcf_metadata.data_dictionary.md
└── vcfstats.csv
```

## File Sources
- manually_generated_tables: tables downloaded from google drive using `notebooks/get_manually_generated_sheets.qmd`
- 