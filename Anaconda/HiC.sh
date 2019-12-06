conda create -n HiC
conda activate HiC

conda config --env --add channels r
conda config --env --add channels bioconda
conda config --env --add channels conda-forge

# some dependencies
conda install bwa
conda install openjdk
conda install bowtie2
conda install bioconda::sambamba
conda install bioconda::samtools
conda install bioconda::snakemake-minimal
conda install pandas
conda install bioconda::fastqc
conda install jrhawley::hicup #(v0.7.2)

conda install scipy matplotlib

conda install bioconda::bedtools
conda install bioconda::biopython
conda install bioconda::bioconductor-genomicranges
conda install r-argparse r-data.table
conda install r-devtools
conda install r-nlme r-mgcv r-rspectra
conda install r-ggplot2
conda install bioconda::multiqc
conda install bioconda::seqtk
conda install bamtools

conda install r-roxygen2
conda install r-bit64
conda install r-irlba
conda install bioconda::cooler
conda install bioconda::pairtools
conda install bioconda::seqkit
conda install tqdm
conda install conda-forge::eigen
conda install bioconda::igvtools
conda install conda-forge::r-rcircos
conda install conda-forge::r-upsetr

conda install jrhawley::pyinterval

conda install seaborn
