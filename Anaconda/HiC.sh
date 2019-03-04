conda create -n HiC
conda activate HiC

conda config --env --add channels r
conda config --env --add channels bioconda
conda config --env --add channels conda-forge

# some dependencies
conda install bwa
conda install openjdk

# Juicer
pushd $CONDA_PREFIX/bin/
curl -O http://hicfiles.tc4ga.com.s3.amazonaws.com/public/juicer/juicer_tools.1.8.9_jcuda.0.8.jar
popd