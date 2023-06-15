# GIAB Data Portal v0.1
Initial version of a Genome In A Bottle Data Portal.

The raw-data tables were generated using a cdk stack, code for the stack can be found https://github.com/usnistgov/giab-data-phase1.

There are three main metadata tables with metadata extracted from the filenames and paths as well as file content along with summary statistics for the different files.
 - `metadata_tables/fastq_metadata.csv` which has metadata and summary statistics for the fastq files on the NIH hosted GIAB ftp site and the Human Genomes Pangenome Project S3 bucket (GIAB samples only).
 - `metadata_tables/bam_metadata.csv` metadata for bam files on the NIH hosted GIAB ftp site.
 - `metadata_tables/vcf_metadata.csv` metadata for vcf files from the same two locations as files in the fastq_metadata table.


For the three file types metadata was initially extracted from the filenames. 
The metadata were enriched by extracting additional metadata from the file contents,
including parsing metadata from sequencing read names (fastq and bam [WIP]) along with metadata from file headers (bams and vcf). 
Summary statistics were calculated using fastqc (for fastqs), samtools stats (for bams), and rtgtools vcfstats (for vcfs).
