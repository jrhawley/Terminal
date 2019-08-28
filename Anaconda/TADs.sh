conda create -n TADs python=2.7.5
conda activate TADs

conda install \
    numpy \
    multiprocess \
    pandas \
    patsy \
    pyparsing \
    pysam \
    python-dateutil \
    pytz \
    dill \
    pyBigWig \
    seaborn \
    scipy \
    scikit-learn \
    interlap \
    bedtools \
    pybedtools

conda install -c jrhawley bctpy statutils
