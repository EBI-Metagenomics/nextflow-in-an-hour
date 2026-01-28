process HMMSCEARCH {

    container "quay.io/biocontainers/hmmer:3.4--hdbdd923_0"
    conda "bioconda::hmmer=3.4"

    publishDir params.outdir

    input:
    path proteins
    path pfam_db

    output:
    path ("hits.txt"), emit: hits_txt

    script:
    """
    hmmsearch --noali --tblout hits.txt ${pfam_db} ${proteins}
    """
}
