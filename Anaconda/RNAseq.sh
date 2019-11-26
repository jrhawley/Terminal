conda create -n RNAseq
conda activate RNAseq

conda install snakemake-minimal \
    r-ggplot2 \
    kallisto \
    r-sleuth \
    rseqc \
    sambamba \
    multiqc \
    fastqc \
    trim-galore \
    bioconductor-edger \
    bioconductor-deseq2 \
    r-data.table \
    r-ggextra \
    bioconductor-sva
