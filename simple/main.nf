include { PYRODIGAL  } from './modules/pyrodigal.nf'
include { HMMSCEARCH } from './modules/hmmsearch.nf'

workflow {
    
    // Run Pyrodigal for gene prediction
    PYRODIGAL(
        file(params.fasta)
    )
    
    // Run HMMSCAN on predicted proteins
    HMMSCEARCH(
        PYRODIGAL.out.faa,
        file(params.pfam_db)
    )
}