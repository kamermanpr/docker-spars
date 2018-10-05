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
# R v3.5.1
# RStudio server:v1.1.456 (all kamermanpr/docker-spars version tags < v2.0.0)
# LaTex (TinyTex distribution, https://yihui.name/tinytex/)
# tidyverse (MRAN 2018-09-01 R v3.5.1 snapshot)
#
FROM rocker/verse:3.5.1
#
# <-- Maintainer -->
#
MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>
#
# <-- Add GitHub package -->
# Patchwork: 22 September 2018 commit: fd7958bae3e7a1e30237c751952e412a0a1d1242
#
RUN Rscript -e "devtools::install_github('thomasp85/patchwork')"
#
# <-- Add MRAN packages -->
#
RUN Rscript -e "install.packages(pkgs = c('car', 'boot', 'ggplot2', 'ggridges', 'ggeffects', 'kableExtra', 'lme4', 'lmerTest', 'lqmm', 'robustlmm', 'influence.ME', 'HLMdiag', 'sjPlot'), dependencies = TRUE)"


