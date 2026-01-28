# Nextflow Protein Prediction Pipeline

A Nextflow pipeline for protein prediction and annotation using [Pyrodigal](https://pyrodigal.readthedocs.io/en/stable/) and [HMMER](http://hmmer.org/) against a mock Pfam database.

## Features

- [Pyrodigal](https://pyrodigal.readthedocs.io/en/stable/): Gene prediction from DNA sequences
- [HMMER](http://hmmer.org/): Protein domain annotation using mock Pfam database

## Project Structure

```
nextflow-pipeline/
├── main.nf                  # Main pipeline
├── nextflow.config          # Configuration
├── modules/                 # Pipeline modules
│   ├── pyrodigal.nf         # Pyrodigal module
│   └── hmmsearch.nf         # HMMER / hmmsearch module
```

## Output

The files are stored in the `results` folder:

- `proteins.faa`: Predicted protein sequences
- `genes.gff`: Gene predictions in GFF format
- `hits.txt`: Pfam domain annotations

## Usage

### Run with default parameters

```bash
nextflow run main.nf
```

### Run with custom parameters

```bash
nextflow run main.nf \
    --input_csv path/to/samples.csv \
    --pfam_db path/to/Pfam-A.hmm \
    --outdir path/to/output
```

### Run with Conda (instead of containers)

Run using the conda profile

```bash
nextflow run main.nf -profile conda \
    --input_csv path/to/samples.csv \
    --pfam_db path/to/Pfam-A.hmm \
    --outdir path/to/output
```

## Software requirements

By default, this pipeline uses containers to manage the software, particularly docker.

## Configuration

Edit `nextflow.config` to adjust:

- Resource allocation (CPUs, memory)
- Working directory
- Error handling strategy

## License

[MIT License](LICENSE)