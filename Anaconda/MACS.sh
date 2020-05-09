conda create -n MACS
conda activate MACS

conda install \
    bioconda::macs2=2.2.4 \
    snakemake-minimal \
    pandas \
    numpy

