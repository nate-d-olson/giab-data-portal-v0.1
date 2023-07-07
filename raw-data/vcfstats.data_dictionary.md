| Field Name                | Data Type | Description                                                         |
|---------------------------|-----------|---------------------------------------------------------------------|
| location                  | String    | The location or filepath of the data                                 |
| failed filters            | Integer   | The number of sequences that failed filters                         |
| passed filters            | Integer   | The number of sequences that passed filters                         |
| snps                      | Integer   | The number of single nucleotide polymorphisms (SNPs)                |
| mnps                      | Integer   | The number of multiple nucleotide polymorphisms (MNPs)              |
| insertions                | Integer   | The number of insertions                                             |
| deletions                 | Integer   | The number of deletions                                              |
| indels                    | Integer   | The number of indels                                                 |
| breakends                 | Integer   | The number of breakends                                              |
| symbolic svs              | Integer   | The number of symbolic structural variants (SVs)                    |
| same as reference         | String    | The flag indicating if the sequence is the same as the reference    |
| phased genotypes          | String    | The flag indicating if the genotypes are phased or unphased         |
| snp transitions/transversions | String | The ratio of SNP transitions to transversions                    |
| total het/hom ratio       | String    | The total heterozygous to homozygous ratio                          |
| snp het/hom ratio         | String    | The SNP heterozygous to homozygous ratio                            |
| mnp het/hom ratio         | String    | The MNP heterozygous to homozygous ratio                            |
| insertion het/hom ratio   | String    | The insertion heterozygous to homozygous ratio                      |
| deletion het/hom ratio    | String    | The deletion heterozygous to homozygous ratio                       |
| indel het/hom ratio       | String    | The indel heterozygous to homozygous ratio                          |
| breakend het/hom ratio    | String    | The breakend heterozygous to homozygous ratio                       |
| symbolic sv het/hom ratio | String    | The symbolic SV heterozygous to homozygous ratio                    |
| insertion/deletion ratio  | String    | The insertion to deletion ratio                                      |
| indel/snp+mnp ratio       | String    | The indel to SNP and MNP ratio                                       |
| partial genotype          | String    | The flag indicating if the genotype is partial or complete          |
| total haploid             | Integer   | The total number of haploid sequences                                |
| haploid snps              | Integer   | The number of SNPs in haploid sequences                             |
| haploid mnps              | Integer   | The number of MNPs in haploid sequences                             |
| haploid insertions        | Integer   | The number of insertions in haploid sequences                       |
| haploid deletions         | Integer   | The number of deletions in haploid sequences                        |
| haploid indels            | Integer   | The number of indels in haploid sequences                           |
| no genotypes              | String    | The flag indicating if there are no genotypes                       |
| missing genotype          | String    | The flag indicating if the genotype is missing                      |
| sample name               | String    | The name of the sample                                              |
| haploid symbolic svs      | Integer   | The number of symbolic SVs in haploid sequences                     |
| complex called            | String    | The flag indicating if the sequence has complex|
| de novo genotypes     | String    | The flag indicating if there are de novo genotypes |
| total polyploid       | Integer   | The total number of polyploid sequences           |
| polyploid snps        | Integer   | The number of SNPs in polyploid sequences         |
| polyploid mnps        | Integer   | The number of MNPs in polyploid sequences         |
| polyploid insertions  | Integer   | The number of insertions in polyploid sequences   |
| polyploid deletions   | Integer   | The number of deletions in polyploid sequences    |
| polyploid indels      | Integer   | The number of indels in polyploid sequences       |
| md5key                | String    | Unique identifier for the file based on the file name and path, generated using the MD5 hashing algorithm|
