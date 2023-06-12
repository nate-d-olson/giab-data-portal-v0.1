Data dictionary for `full_fq_metadata.csv`
The full_fq_metadata.csv was generate using the software package SeqSleuth. Which predicts the sequencing technology on for a remote file based on the file url then assuming read platform specific read naming conventions.

`filename`:

- Description: This is a URL link to a .fastq file which contains the genetic sequencing data. These files are located in different directories corresponding to specific experimental setups and the genomic region sequenced.
- Data Type: String (URL format)
- Example: "https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/analysis/MSSM_MsPAC_SVs_assemblies_06042019/HG002/MsPAC_assemblies/haplotype_2/chr1.fastq"
- Possible Values: Any valid URL link to a .fastq file

`predicted_tech`:

- Description: This field indicates the technology or method used to generate the data contained in the URL. This includes various forms of genome sequencing technology.
- Data Type: String
- Example: "Assembly"
- Possible Values: "Assembly", "10XGenomics", "Dovetail", "OxfordNanopore", "Illumina", "Moleculo", "PacBio", "StrandSeq", "BGI", "IonTorrent"

`metadata`:

- Description: This field contains specific information about the data based on the platform used. The keys in the JSON string are not consistent across platforms, but some general keys include `tech`, `read_names`, `sample`, `library`, `set`, `Library_Field_X`, `read_name`, `note`, `instrument_id`, `run_number`, `flow_cell_id`, `flow_cell_lane`, `movie_name`, `read_type`.
- Data Type: String (JSON format)
- Example: "{"tech": "unimplemented parser", "read_names": ["1.10000.176640.0_2.raw_contig.0.quivered", "1.10000.176640.0_2.raw_contig.2.quivered", "1.10000.176640.0_2.raw_contig.3.quivered", "1.10000.176640.0_2.raw_contig.4.quivered", "1.10000.176640.0_2.raw_contig.1.quivered"]}"
- Possible Values: Any valid JSON string containing additional information about the data
