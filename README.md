# Nextflow in less than one hour

This is a short introduction to Nextflow, it is mean to demonstrate some of the key feature of the language concisely.

The repo contains two workflows, one named `simple` and another one named `samplesheets`. They are equivalent, but the second one adds some code to support multiples samples in the same workflow, to benefit from the parallelization that Nextflow provides.

## Requirements

In order to run these workflows users need:
- [Nextflow](https://www.nextflow.io/) (any recent version should work)
- [Docker](https://www.docker.com/) or [micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html) (albeit conda should work to if the config is amended -- settings `conda.useMicromamba` to false)

The repo is bundled with some test data, so there is no need to download anything.

## Setup

Provided that Nextflow and docker/micromamba are installed, users are required to clone the repository.

## Workflow Details

Both workflows perform protein prediction and annotation:
- [Pyrodigal](https://pyrodigal.readthedocs.io/en/stable/): Gene prediction from DNA sequences
- [HMMER](http://hmmer.org/): Protein domain annotation using a mock Pfam database

The `samplesheets` workflow additionally demonstrates how to process multiple samples in parallel using a CSV input file.

## Expected Outputs

The workflows generate:
- Predicted protein sequences in FASTA format
- Gene predictions in GFF format
- Protein domain annotations

## Additional Information

Each workflow (`simple` and `samplesheets`) contains a README.md file with detailed instructions, parameter descriptions, and configuration options.