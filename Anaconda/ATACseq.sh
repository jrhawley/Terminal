conda create -n ATACseq
conda activate ATACseq

# no dependencies
conda install -c bioconda sambamba samtools

# some dependencies
conda install bioconda::bedtools=2.23.0
conda install bioconda::cutadapt
conda install bioconda::fastqc
conda install bioconda::bowtie2
conda install bioconda::snakemake-minimal conda-forge::ratelimiter
conda install pandas
conda install ucsc-bedclip
conda install pysam

# bioconductor
conda install -c bioconda bioconductor-edger bioconductor-diffbind bioconductor-deseq2

conda install pybedtools
conda install scipy
conda install r-dunn.test
