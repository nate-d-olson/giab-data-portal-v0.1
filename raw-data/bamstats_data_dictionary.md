| Field Name                                                      | Data Type | Description                                                         |
|-----------------------------------------------------------------|-----------|---------------------------------------------------------------------|
| filepath   | String    | The path of the directory where the file is stored |
| bam        | String    | The BAM file |
| sort_order | String    | The sorting order of the BAM file |
| aligner    | String    | command used to align reads to the reference extracted from the bam header  |
| reference_genome| String | The name of the reference genome used for the BAM file  |
| stats      | String    | These are json formatted strings generated using samtools index stats command |
| md5key     | String    | Unique identifier for the file based on the file name and path, generated using the MD5 hashing algorithm |
