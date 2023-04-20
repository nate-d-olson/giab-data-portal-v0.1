# GIAB Data Portal v0.1
Initial version of a Genome In A Bottle Data Portal.

The raw-data tables were generated using a cdk stack, code for the stack can be found https://github.com/usnistgov/giab-data-phase1.

There are three  main metadata tables.
 - `fastq_metadata.csv` which has the fastq files on the NIH hosted GIAB ftp site and the Human Genomes Pangenome Project S3 bucket (GIAB samples only).
 - `bam_metadata.csv` contains the bam files and summary statistics for bam files on the NIH hosted GIAB ftp site. (This table is still a work in progress)
 - `vcf_metadata.csv` with the vcf files from the same two locations as files in the fastq_metadata table.


For the three file types metadata was initially extracted from the filenames. 
The metadata were enriched by extracting additional metadata from the file contents and calculating summary statistics using fastqc (for fastqs), samtools stats (for bams), and rtgtools vcfstats (for vcfs).
