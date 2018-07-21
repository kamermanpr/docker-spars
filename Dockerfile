###############################################################################
# Build an image with the environment required to run the SPARS repo analysis #
#                                                                             #
##-- Build command --##                                                       #                                                                                                           
# docker build                                                                #
#                                                                             #
##-- Run command --##                                                         #
# docker run -d \                                                             #
# -p 8787:8787 \                                                              #
# -v /PATH:/home/rstudio \                                                    #
# --name spars \                                                              #
# kamermanpr/docker-spars:/version/                                           #                                                            
#                                                                             #
###############################################################################

##-- Base image --##
# Debian:stretch (kamermanpr/docker-spars:v1.0.?) +
# R3.5.0
# RStudio server:v1.1.456 (kamermanpr/docker-spars:v1.0.?)
# LaTex (TinyTex distribution, https://yihui.name/tinytex/)
# tidyverse (MRAN snapshot for R3.5.0)

FROM rocker/verse:3.5.0

##-- Maintainer --##

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

##-- Add GitHub packages --##
# The latest thomasp85/patchwork commit (7fb35b1) at the time of writing 
# this dockerfile fails, and therefore the installation uses the previous 
# commit (1d3eccb).

# Also, patchwork automatically installs the latest version of ggplot2 
# from GitHub (v3.0.0 for kamermanpr/docker-spars:v1.0.?). To ensure 
# consistency across packages with the MRAN 2018-06-01 R v 3.5.0 snapshot, 
# ggplot2 (v2.2.1) is re-installed in the MRAN package step below.

RUN Rscript -e "devtools::install_github('thomasp85/patchwork', \
					 ref = '1d3eccb2e065b79ace1e993c895e0b28dd870ee2')"

##-- Add MRAN packages --##

RUN Rscript -e "install.packages(c('ggplot2', \
                                 'ggridges', \
				 'kableExtra', \
                                 'robustlmm', \
                                 'lme4', \
                                 'lqmm', \
                                 'HLMdiag', \
                                 'sjPlot', \
                                 'car', \
                                 'lmerTest', \
                                 'influence.ME', \
                                 'boot'))"
