###############################################################################
# Build an image with the environment required to run the SPARS repo analysis #
#                                                                             #
##-- Build command --##                                                       #                                                                                                           
# docker build --build-arg RSTUDIO_VERSION=1.1.456                            #
#                                                                             #
##-- Run command --##                                                         #
# docker run -d -p 8787:8787                                                  #
#                                                                             #
###############################################################################

##-- Base image --##
# Debian (stretch) +
# R3.5.0 +
# RStudio server v1.1.456 (specified in docker --build-arg)
# LaTex (TinyTex distribution, https://yihui.name/tinytex/)
# tidyverse (MRAN snapshot for R3.5.0)
FROM rocker/verse:3.5.0

##-- Maintainer --##
MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

##-- Add MRAN packages --##
RUN Rscript -e "install.packages(c('ggridges', 'kableExtra', 'robustlmm', 'lme4', 'lqmm', 'HLMdiag', 'sjPlot', 'car', 'lmerTest', 'influence.ME', 'boot'))"

##-- Add GitHub packages --##
RUN Rscript -e "devtools::install_github("thomasp85/patchwork")"
