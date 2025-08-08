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

## Develop, Run, and Test Locally

Prerequisites
- R (4.x) and Quarto installed locally
- Recommended: RStudio

Setup
- R -q -e 'renv::restore()'

Run ETL and render site
- R -q -e 'source("scripts/01_ingest.R"); source("scripts/02_transform.R"); source("scripts/03_validate.R")'
- quarto render
- Open docs/index.html

Makefile (optional shortcuts)
- make etl     # runs the ETL pipeline
- make render  # renders Quarto to docs/
- make site    # etl + render

Project structure essentials
- raw-data/: input CSV/JSON/TSV
- scripts/: ETL scripts (01_ingest.R, 02_transform.R, 03_validate.R)
- data/derived/: ETL outputs and validation report
- docs/: rendered Quarto site

## Branching and Contribution Workflow

We use a lightweight gitflow approach:
- main: production (auto-deploys to GitHub Pages)
- develop: integration branch for next release
- feature/*: short-lived branches targeting develop (e.g., feature/schema-v2)
- release/* and hotfix/* as needed

Submitting changes
- Branch from develop (or feature/), open a PR to develop with a clear summary, data impact, and screenshots of the rendered pages if applicable.
- Once validated, merge develop -> main to publish.

## CI/CD and Dev Previews

Production deploy (on push to main)
- GitHub Actions builds ETL outputs, renders the site, and deploys to GitHub Pages from docs/.

Dev preview (PRs and manual runs)
- On pull_request to main or develop and on workflow_dispatch, CI runs ETL + render and:
  - Uploads the rendered site as a build artifact for download.
  - Publishes a Pages preview URL when available (Actions deploy-pages preview).

Run CI locally
- Install act (https://github.com/nektos/act)
- act -j build-dev           # run the dev workflow locally
- act -j deploy-pages -e event.json  # simulate main push (requires configuration)

Notes
- Secrets for external integrations (AWS, Google) are not needed for Phase 1; later phases will use repo secrets in CI.
