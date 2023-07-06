| Field                | Data Type     | Description                                                                                    |
|----------------------|---------------|------------------------------------------------------------------------------------------------|
| filepath             | String        | The path of the file location on the system|
| bam                  | String        | The BAM file name                                                                              |
| indexfile            | String        | The name of the index file for the corresponding BAM file|
| filesize_in_Gb       | Float         | The size of the file in gigabytes (Gb)                                                        |
| readme               | String        | The path of the readme file for the corresponding BAM file                             |
| biosample            | String        | The BioSample ID for the sample                                                                       |
| dna_id               | String        | The ID of the DNA sample|
| sort_order           | String        | The sort order used for the BAM file                                                                    |
| aligner_cmd          | String        | The command used for alignment                                                                 |
| reference_genome     | String        | The name of the reference genome used for the BAM file|
| notes           | String        | 	Any additional notes about the metadata provided for this file|
| stats                | String        | Statistics information                                                                         |
| ftp_bam_file         | String        | The FTP URL for the BAM file                                                                   |
| tech                 | String        | The technology used for sequencing                                                             |
| bam_id               | String        | The BAM file identifier                                                                        |
| giab_id              | String        | The GIAB ID for the sample                                                                     |
| trio                 | String        | The relationship of the sample to the Ashkenazi trio                                                                    |
| description          | String        | Description or additional information about the data                                           |
| coverage             | String        | Information about coverage                                                                     |
| input_fqs            | String        | Input fastq files                                                                              |
| aligner              | String        | command used to align reads to the reference extracted from the bam header                                                               |
| ftp_readme_url       | String        | The FTP URL for the readme file                                                                |
| ftp_dir              | String        | The FTP directory or location                                                                  |
| ftp_bai_file         | String        | The FTP URL for the corresponding BAI file                                                     |
| ftp_md5_list_file    | String        | The FTP URL for the MD5 list file                                                              |
| sra_ids              | String        | The SRA IDs or identifiers                                                                     |
| bioproject_id        | String        | The BioProject ID or identifier                                                                |
| other_seq_data       | String        | Information about other sequencing data                                                        |
| phased               | String        | Phased information                                                                             |
| ftp_input_vcf        | String        | The FTP URL for the input VCF file                                                             |
| ftp_bam_md5          | String        | The FTP URL for the BAM file MD5 checksum                                                      |
| ftp_bai_md5          | String        | The FTP URL for the BAI file MD5 checksum                                                      |
| external_directory   | String        | The external directory or location                                                             |
| external_file_link   | String        | The external file link or URL                                                                  |
| external_md5_link    | String        | The external MD5 link or URL                                                                   |
| external_readme      | String        | Information about the external readme file                                                     |
