conda create -n RNAseq bioconductor-ruvseq
conda activate RNAseq

conda install snakemake-minimal
conda install r-ggplot2
conda install kallisto
conda install r-sleuth

conda install bioconda::rseqc
conda install bioconda::sambamba
conda install bioconda::multiqc
conda install bioconda::fastqc
conda install bioconda::trim-galore

