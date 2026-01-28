include { PYRODIGAL } from './modules/pyrodigal.nf'
include { HMMSEARCH } from './modules/hmmsearch.nf'

workflow {

    // Run Pyrodigal for gene prediction
    PYRODIGAL(
        file(params.fasta)
    )

    // Run HMMSEARCH on predicted proteins
    HMMSEARCH(
        PYRODIGAL.out.faa,
        file(params.pfam_db),
    )
}
