| Field Name          | Data Type | Description                                                                                      |
|---------------------|-----------|--------------------------------------------------------------------------------------------------|
| filepath            | String    | TThe path of the directory where the file is stored    |
| location            | String    | The location of the file   |
| filesize_in_Gb      | Float     | The size of the file in gigabytes (Gb)     |
| readme              | String    | Information about the availability of a readme file   |
| giab_id        | String    | The GIAB ID for the sample|
| biosample           | String    | The BioSample ID for the sample    |
| trio                | String    | The relationship of the sample to the Ashkenazi trio  |
| dna_id              | String    | The ID of the DNA sample   |
| failed_filters      | Integer   | The number of failed filters   |
| passed_filters      | Integer   | The number of passed filters   |
| snps                | Integer   | The number of SNPs identified in this entry  |
| mnps                | Integer   | The number of MNPs identified in this entry |
| insertions          | Integer   | The number of insertions |
| deletions           | Integer   | The number of deletions  |
| indels              | Integer   | The number of indels     |
| same_as_reference   | Integer   | Information about being the same as the reference |
| phased_genotypes    | Integer   | The number of phased genotypes  |
| snp transitions/    | String    | The ratio of SNP transitions to transversions|
| hethom_ratio        | String    | The heterozygous to homozygous ratio   |
| insertion/deletion  | String    | The ratio of insertions to deletions  |
| indel/snp+mnp ratio | String    | The ratio of indels to SNPs and MNPs  |
| breakends           | Integer   | The number of breakends  |
| symbolic svs        | Integer   | The number of symbolic structural variations  |
| symbolic sv het/hom | String    | The ratio of symbolic SVs heterozygous to homozygous |
| missing genotype    | Integer   | The number of missing genotypes |
| no genotypes        | Integer   | The number of genotypes that are not available|
| partial genotype    | Integer   | The number of partial genotypes |
| md5key              | String    | Unique identifier for the file based on the file name and path, generated using the MD5 hashing algorithm |
| ftp_vcf_file        | String    | The FTP URL for the VCF file  |
| tech                | String    | The technology used   |
| vcf_id              | String    | The VCF file identifier  |
| input_bam           | String    | The input BAM file |
| giab_id             | String    | Identifier for the Genome in a Bottle (GIAB) dataset|
| variant_caller      | String    | The software tool used to identify variants in the sequenced sample  |
| ref_genome          | String    | The reference genome used for aligning the sequenced data and variant calling.   |
| aligner             | String    | command used to align reads to the reference extracted from the bam header   |
| readme_url          | String    | The URL for the readme file |
| ftp_dir             | String    | The FTP directory or location   |
| ftp_file_list       | String    | The list of files in the FTP directory                                                           |
| md5_list            | String    | The list of MD5 checksums  |
| notes               | String    | Additional notes or comments  |
