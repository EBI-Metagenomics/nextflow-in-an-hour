// Include modules
include { PYRODIGAL } from './modules/pyrodigal.nf'
include { HMMSEARCH } from './modules/hmmsearch.nf'

workflow {

    // Channel for input samples
    channel.fromPath(params.input_csv)
        .splitCsv(header: true)
        .map { row ->
            def meta = [
                sample: row.sample
            ]
            def fasta = file(row.fasta_path)
            [meta, fasta]
        }
        .set { sample_channel }

    // Run Pyrodigal for gene prediction
    PYRODIGAL(sample_channel)

    // Run HMMSCAN on predicted proteins
    HMMSEARCH(
        PYRODIGAL.out.faa,
        file(params.pfam_db),
    )
}
