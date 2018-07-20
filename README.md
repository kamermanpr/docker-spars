# docker-spars

A dockerfile to create an image of the R environment required to run the SPARS data analysis scripts.

The image can be found on Docker Hub at [kamermanpr/docker-spars](https://hub.docker.com/r/kamermanpr/docker-spars)

## R environment

The image is built using the [rocker/verse](https://hub.docker.com/r/rocker/verse/) image of [base R](https://cran.r-project.org/) versioned on _v3.5.0_, and includes [_RStudio server_](https://www.rstudio.com/products/rstudio/#Server), the [_TinyTex_](https://yihui.name/tinytex/) Latex distribution, the [_tidyverse_](https://www.tidyverse.org/) suite of R packages (with dependencies), and several R packages (with dependencies) that specifically are required to run the markdown scripts in the [SPARS](https://github.com/kamermanpr/SPARS). CRAN packages were installed from [MRAN](https://mran.microsoft.com/timemachine) using the 2018-06-01 snapshot for R3.5.0.

### Details
- **OS:** Debian 
  - stretch _(at the time the image was first created using the Dockerfile)_  
- **R:** 
  - v3.5.0  
- **RStudio server:** 
  - v1.1.456 _(at the time the image was first created using the Dockerfile)_ 
- **MRAN packages:** 
  - tidyverse 
  - boot
  - car
  - kableExtra
  - ggridges
  - HLMdiag
  - influence.ME
  - lme4
  - lmerTest
  - lqmm
  - robustlmm
  - sjPlot
- **GitHub packages:** 
  - patchwork ([thomasp85/patchwork](https://github.com/thomasp85/patchwork))  
- **LaTex:** TinyTex
