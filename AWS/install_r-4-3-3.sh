#!/bin/bash

# Create a conda environment
conda create -n r-4-3-3 r-base=4.3.3 -y

# Consider addressing your conda initialization instead.
source ~/.bashrc

# Activate the Conda Environment
conda activate r-4-3-3

conda install bioconda::bioconductor-geoquery  -y

conda install bioconda::bioconductor-hgu133plus2.db -y

conda install bioconda::bioconductor-limma -y

conda install conda-forge::r-matrixtests -y

conda install bioconda::bioconductor-edger -y

conda install conda-forge::r-ggplot2 -y

conda install conda-forge::r-ggvenn -y 

conda install conda-forge::r-tidyr -y 

conda install conda-forge::r-ggnewscale -y

conda install bioconda::bioconductor-topgo -y 

conda install bioconda::bioconductor-go.db -y

conda install bioconda::bioconductor-keggrest -y

conda install bioconda::bioconductor-reactomecontentservice4r -y

conda install bioconda::bioconductor-fgsea -y

conda install bioconda::bioconductor-deseq2 -y

conda install conda-forge::r-gsa -y

conda install bioconda::bioconductor-safe -y

conda install bioconda::bioconductor-annotationdbi -y

conda install bioconda::bioconductor-keggdzpathwaysgeo -y 
conda install r::r-digest -y
conda install conda-forge::r-rngtools -y
conda install conda-forge::r-dorng -y

R -e 'install.packages("BiocManager")'

conda install conda-forge::r-stringi -y
conda install conda-forge::r-stringr -y

conda install conda-forge::r-meta -y

conda install conda-forge::r-cowplot -y 

conda install conda-forge::r-tidyr -y
conda install conda-forge::r-ggpubr -y

conda install conda-forge::r-dplyr -y

R -e 'install.packages(c("IRkernel","gridExtra"), repos="http://cran.rstudio.com/")'

# Install the kernel specification for Jupyter
R -e 'IRkernel::installspec(name = "R-4-3-3", displayname = "R-4-3-3")' 