process PYRODIGAL {
    tag "${meta.sample}"

    container "quay.io/biocontainers/pyrodigal:3.7.0--py311haab0aaa_0"
    conda "bioconda::pyrodigal=3.7.0"

    publishDir {
        "${params.outdir}/${meta.sample}"
    }

    input:
    tuple val(meta), path(fasta)

    output:
    tuple val(meta), path("${meta.sample}_proteins.faa"), emit: faa
    tuple val(meta), path("${meta.sample}_genes.gff"), emit: gff

    script:
    """
    pyrodigal -i ${fasta} -o ${meta.sample}_genes.gff -a ${meta.sample}_proteins.faa
    """
}
