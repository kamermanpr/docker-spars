###############################################################################
# 									      #
# KAMERMANPR/DOCKER-SPARS						      #
#									      #
# Build an image with the environment required to run the SPARS repo analysis #
#                                                                             #
# <-- Build command -->                                                       #                                                                                                           
# docker build -t kamermanpr/docker-spars:<version>                           #        
#                                                                             #
# <-- The build image can be downloaded from Docker Hub -->                   #
# docker pull kamermanpr/docker-spars:<version>                               # 
#									      #
# <-- Run command -->                                                         #
# docker run -d -p 8787:8787 -v </PATH>:/home/rstudio --name spars \          #                                                     
# kamermanpr/docker-spars:<version>    					      #
#									      #
# <-- Login to RStudio -->                                                    #                                                                                                                                     
# In your browser, navigate to: localhost:8787			              #
# Username: rstudio							      #
# Password: rstudio							      #
#                                                                             #
###############################################################################
#
# <-- Base image -->
# Debian:stretch (all kamermanpr/docker-spars version tags < v2.0.0)
# R v3.5.0
# RStudio server:v1.1.456 (all kamermanpr/docker-spars version tags < v2.0.0)
# LaTex (TinyTex distribution, https://yihui.name/tinytex/)
# tidyverse (MRAN 2018-06-01 R v3.5.0 snapshot)
#
FROM rocker/verse:3.5.0
#
# <-- Maintainer -->
#
MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>
#
# <-- Add GitHub package -->
# Lock thomasp85/patchwork installation to 12 June 2018 commit: 
# 1d3eccb2e065b79ace1e993c895e0b28dd870ee2
#
# Installation of patchwork automatically installs the latest version 
# of ggplot2. To ensure consistency across packages with the 
# MRAN 2018-06-01 R v3.5.0 snapshot, ggplot2 (v2.2.1) is 
# re-installed in the MRAN package step below.
#
RUN Rscript -e "devtools::install_github('thomasp85/patchwork', ref = '1d3eccb2e065b79ace1e993c895e0b28dd870ee2')"
#
# <-- Add MRAN packages -->
#
RUN Rscript -e "install.packages(c('boot', 'ggplot2', 'ggridges', 'kableExtra', 'robustlmm', 'lme4', 'lqmm', 'HLMdiag', 'sjPlot', 'car', 'lmerTest', 'influence.ME'))"

