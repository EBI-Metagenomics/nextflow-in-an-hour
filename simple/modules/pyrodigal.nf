process PYRODIGAL {

    container "quay.io/biocontainers/pyrodigal:3.7.0--py311haab0aaa_0"
    conda "bioconda::pyrodigal=3.7.0"

    input:
    path fasta

    output:
    path ("proteins.faa"), emit: faa
    path ("proteins.gff"), emit: gff

    script:
    """
    pyrodigal -i ${fasta} -a proteins.faa -o proteins.gff -j ${task.cpus}
    """
}
