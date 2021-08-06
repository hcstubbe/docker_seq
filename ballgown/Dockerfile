FROM r-base:latest

# install required R packages 
# (change it dependeing on the packages you need)

RUN R -e "install.packages('BiocManager', repos='http://cran.rstudio.com/')"
RUN R -e "BiocManager::install(version = '3.13')"
RUN R -e "BiocManager::install('genefilter')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
