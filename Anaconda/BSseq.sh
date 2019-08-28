conda create -n BSseq
conda activate BSseq
conda config --env --add channels bioconda
conda config --env --add channels conda-forge

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
# add the following to $CONDA_PREFIX/conda-meta/pinned:
# curl=7.64.0
# krb5=1.16.3
# libcurl=7.64.0
# libssh2=1.8.0

conda install bioconductor-bsseq
conda install bioconductor-bumphunter
conda install bioconductor-annotationhub
conda install bioconductor-annotatr

conda install r-argparse
conda install conda-forge::r-upsetr
conda install conda-forge::r-pheatmap
conda install click future jinja2 lzstring markdown
conda install conda-forge::simplejson=3.16.0
conda install conda-forge::spectra
conda install bioconda::multiqc=1.7
conda install bioconda::bioconductor-minfi
conda install bioconda::bioconductor-illuminahumanmethylationepicmanifest=0.3.0
conda install bioconda::bioconductor-illuminahumanmethylationepicanno.ilm10b4.hg19

conda install r-viridis
conda install jrhawley::dmrseq
conda install bioconda::bioconductor-illuminahumanmethylation450kmanifest
conda install bioconda::bioconductor-illuminahumanmethylation450kanno.ilmn12.hg19
conda install bioconductor-bsgenome.hsapiens.ucsc.hg38
conda install bioconductor-bsgenome.hsapiens.ucsc.hg19
conda install scipy
