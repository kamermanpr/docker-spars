# docker-spars

A dockerfile to create an image of the R environment required to run the SPARS data analysis scripts.

----

## Using Docker to run the SPARS analysis

You need to have Docker installed on your computer. To do so, go to [Docker.com](https://www.docker.com/community-edition#/download) and follow the instructions for downloading and installing Docker for your operating system. Once Docker has been installed, follow the steps below, noting that Docker commands are entered in a terminal window (Linux and OSX/macOS) or command prompt window (Windows).

#### Download the latest image

Type: `docker pull kamermanpr/docker-spars:v1.0.3`.

#### Run the container

Type: `docker run -d -p 8787:8787 -v </PATH>:/home/rstudio --name spars kamermanpr/docker-spars:v1.0.3`

Where `</PATH>` refers to the path to the SPARS directory on your computer, which you either cloned from GitHub ([_kamermanpr/SPARS_](https://github.com/kamermanpr/SPARS), `git clone https://github.com/kamermanpr/SPARS`), or downloaded and extracted from figshare ([DOI: 10.6084/m9.figshare.6561743](https://doi.org/10.6084/m9.figshare.6561743)).

#### Login to RStudio

- Open a web browser window and nativagte to: `localhost:8787`

- In the RStudio Server login window, use the following credentials:
    - Username: _rstudio_	
    - Password: _rstudio_
    
#### Prepare the SPARS directory

The SPARS directory comes with the outputs of all the analysis scripts in the _/outputs_ directory (_html_ and _md_ formats). 

Should you wish to run the scripts yourself, there are several preparatory steps that are require:  
1. Clean the environment by entering `make clean` in the _Terminal_ tab in RStudio.

2. Acquire the data. The data required to run the scripts have not been included in the repo because participants in the studies did not consent to public release of their data. However, the data are available on request from Tory Madden (torymadden@gmail.com) or Peter Kamerman (peter.kamerman@gmail.com). Once the data have been obtained, the files should be copied into the _/data_ subdirectory and the cleaned data generated using one of the following methods:
    - Type `make data-cleaned/SPARS_A.rds` and then `make data-cleaned/SPARS_B.rds` in the _Terminal_ tab in RStudio;  
    - Type `source('0A-clean-data.R')` and then `source('0B-clean-data.R')` in the _Console_ tab in RStudio;
    - Open _0A-clean-data.R_ and _0B-clean-data.R_ scripts through the _File_ tab in RStudio, and then click the **'Source'** button on the right of the _Script_ console in RStudio for each script.  

#### Run the SPARS analysis scripts

Run the RMarkdown scripts using one of the following methods:  
- To run all the scripts, type `make all` in the _Terminal_ tab in RStudio;  
- To run individual scripts, type `make outputs/<NAME_OF_OUTPUT_FILE>.html` in the _Terminal_ tab in RStudio;  
- To run individual scripts, open the relevant _*.Rmd_ file through the _File_ tab in RStudio, and then click the **'knit'** button on the left of the _Script_ console in RStudio. 

#### Shutting down

Once done, log out of RStudio Server and type the following to stop the Docker container: `docker stop spars`. If you then want to remove the container, type: `docker rm spars`. If you also want to remove the Docker image you downloaded, type: `docker rmi kamermanpr/docker-spars:v1.0.3`
    
----

## R environment

The image is built using the [rocker/verse](https://hub.docker.com/r/rocker/verse/) image of [base R](https://cran.r-project.org/) _v3.5.0_, and includes [_RStudio server_](https://www.rstudio.com/products/rstudio/#Server), the [_TinyTex_](https://yihui.name/tinytex/) Latex distribution, the [_tidyverse_](https://www.tidyverse.org/) suite of R packages (with dependencies), and several R packages (with dependencies) that are required to run the markdown scripts in [SPARS](https://github.com/kamermanpr/SPARS). CRAN packages were installed from [MRAN](https://mran.microsoft.com/timemachine) using the 2018-06-01 snapshot for R _v3.5.0_. The only package installed form GitHub (_thomasp85/patchwork_) was locked to the 12 June 2018 commit: [_1d3eccb2e065b79ace1e993c895e0b28dd870ee2_](https://github.com/thomasp85/patchwork/tree/1d3eccb2e065b79ace1e993c895e0b28dd870ee2).

### Details
- **OS:**  
    - Debian:stretch _(kamermanpr/docker-spars:v1.0.3)_   
- **R:**  
    - v3.5.0   
- **RStudio server:**  
    - v1.1.456 _(kamermanpr/docker-spars:v1.0.3)_  
- **GitHub packages:**  
    - patchwork  
- **MRAN packages:**  
    - boot  
    - car  
    - kableExtra
    - ggplot2
    - ggridges
    - HLMdiag
    - influence.ME
    - lme4
    - lmerTest
    - lqmm
    - robustlmm
    - sjPlot
    - tidyverse 
- **LaTex:**   
    - TinyTex
