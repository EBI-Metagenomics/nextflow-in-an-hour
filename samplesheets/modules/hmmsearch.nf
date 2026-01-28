process HMMSEARCH {

    tag "${meta.sample}"

    container "quay.io/biocontainers/hmmer:3.4--hdbdd923_0"

    publishDir {
        "${params.outdir}/${meta.sample}"
    }

    input:
    tuple val(meta), path(proteins)
    path pfam_db

    output:
    tuple val(meta), path("${meta.sample}.txt"), emit: hits

    script:
    """
    hmmsearch --noali --tblout ${meta.sample}.txt ${pfam_db} ${proteins}
    """
}
