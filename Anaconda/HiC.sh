conda create -n HiC
conda activate HiC

conda config --env --add channels r
conda config --env --add channels bioconda
conda config --env --add channels conda-forge

# some dependencies
conda install bwa
conda install openjdk
conda install bioconda::sambamba
conda install bioconda::samtools
conda install bioconda::snakemake-minimal
conda install pandas
conda install bioconda::fastqc
conda install bioconda::hicup

conda install scipy matplotlib

# Juicer
pushd $CONDA_PREFIX/bin/
curl -O http://hicfiles.tc4ga.com.s3.amazonaws.com/public/juicer/juicer_tools.1.8.9_jcuda.0.8.jar
popd

# HiCUP (v0.7.2)
pushd $HOME/Source/
curl -O http://www.bioinformatics.babraham.ac.uk/projects/hicup/hicup_v0.7.2.tar.gz
tar -xvzf hicup_v0.7.2.tar.gz
## add this directory to PATH in $CONDA_PREFIX/etc/conda/{de,}activate.d/env_vars.sh
popd

# TADbit
#   IMP package
conda install -c salilab imp
#   MCL tool
pushd $HOME/Source
curl -O https://micans.org/mcl/src/mcl-latest.tar.gz
tar -xvzf mcl-latest.tar.gz
pushd mcl-14-137
./configure --prefix=$CONDA_PREFIX
make install
popd
#   TADbit
wget -O TADbit-0.4.tar.gz https://github.com/3DGenomes/TADbit/archive/v0.4.tar.gz
tar -xvzf TADbit-0.4.tar.gz
pushd TADbit-0.4
#   was designed for Python 2, had to edit print statements to have brackets, and `raw_input` -> `input`
python setup.py install
popd; popd

conda install bioconda::bedtools=2.23.0
conda install bioconda::biopython
conda install bioconda::bioconductor-genomicranges
conda install r-argparse r-data.table
conda install r-devtools
conda install r-nlme r-mgcv r-rspectra
conda install r-ggplot2
conda install bioconda::multiqc=1.7
conda install bioconda::seqtk
conda install bamtools

conda install r-roxygen2
conda install r-bit64
