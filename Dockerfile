################################################################
# Build the environment required 
# to run the SPARS repo analysis
#
# OS:
# Debian (latest) +
#
# R:
# R3.5.0 + 
#
# MRAN packages:
# tidyverse 
################################################################

# Base image
FROM rocker/r-ver:3.5.0

# Maintainer
MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

# Add MRAN packages
RUN Rscript -e "install.packages(c('dplyr', 'ggplot2', 'tidyverse'))"