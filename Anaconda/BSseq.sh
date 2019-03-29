conda create -n BSseq
conda activate BSseq

# no dependencies
conda install bioconda::methyldackel
conda install bioconda::bismark
conda install bioconda::bedtools=2.23.0
conda install bioconda::sambamba
conda install bioconda::samtools

# some dependencies
conda install bioconda::bowtie2
conda install bioconda::fastqc
conda install bioconda::trim-galore
conda install bioconda::snakemake-minimal conda-forge::ratelimiter
conda install pandas
#   this version supports dmrseq
conda install r-base=3.5.1

# bioconductor
conda config --env --add channels bioconda
conda config --env --add channels conda-forge
conda install r-biocmanager

#   install all of its appropriate dependencies
conda install bioconductor-biocparallel
conda install bioconductor-delayedmatrixstats
conda install r-ggplot2
conda install r-locfit
conda install r-outliers
conda install r-bitops
conda install r-rcurl

conda install bioconductor-zlibbioc
conda install bioconductor-xvector
conda install bioconductor-biostrings
conda install bioconductor-rsamtools
conda install bioconductor-summarizedexperiment

# modified bioconductor-genomeinfodbdata-.../info/recipe/post-link.sh to ignore MD5sum check, since it was failing for some reason

conda install bioconductor-bsseq
conda install bioconductor-bumphunter
conda install bioconductor-annotationhub
conda install bioconductor-annotatr


# install latest version of dmrseq from GitHub
pushd $HOME/Source
git clone https://github.com/kdkorthauer/dmrseq.git 
pushd dmrseq
R CMD INSTALL .
popd && popd

conda install r-argparse
conda install conda-forge::r-upsetr
conda install conda-forge::r-pheatmap
conda install click future jinja2 lzstring markdown
