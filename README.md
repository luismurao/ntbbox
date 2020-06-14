# NicheToolBox

<span style="color:blue">`ntbbox`</span> is the the ligth version of `nichetoolbox`. The aim of this package is to provide the base functions of behaind the Graphical User Interface (GUI) of <span style="color:red">[`ntbox`](https://github.com/luismurao/ntbox)</span>.

# Installation

<span style="color:red">**Windows users:**</span> Before installation it is important to have installed [Rtools](https://cran.r-project.org/bin/windows/Rtools/).


## Complete installation guide

Complete installation guide for Windows, Linux, and MacOS users https://luismurao.github.io/ntbox_installation_notes.html

```r
if (!require('devtools')) install.packages('devtools')
devtools::install_github('luismurao/ntbbox')
```

# Usage

This is basic example on how to fit a Minimum Volume Ellpsoid using `ntbbox`
functions.

For more examples on how to use the package go to Reference

```r
library(ntbbox)
## Load niche data
## Not run: 
d_cardon <-  read.csv(system.file("extdata/csv",
                                 "cardon_virtual.csv",
                                 package = "ntbbox"))
## Compute the centroid and shape (covariance matrix) of the ellipsoid model.
covar_centroid <- cov_center(d_cardon,mve=TRUE,level=0.99,vars=c(3,4,5))
## RasterStack with the niche variables
nicheStack <- raster::stack(list.files(system.file("extdata/rasters",
                                       package = "ntbbox"),
                                       pattern = ".asc$",
                                       full.names = TRUE))
# Fitting the ellipsoid model
ellipsoidMod <- ellipsoidfit(nicheStack,
                             covar_centroid$centroid,
                             covar_centroid$covariance,
                             level=0.99,plot=TRUE,size=3)
plot(ellipsoidMod$suitRaster)
```
# Acknowledgements

Posgrado en Ciencias Biológicas UNAM for academic training; GSoC 2016, PAIPIIT IN112175 (2015) and IN116018 (2018) for partial financial support. Special thanks to Comisión Nacional para el Conocimiento y Uso de la Biodiversidad (CONABIO) for providing web support and space on their servers http://shiny.conabio.gob.mx:3838/nichetoolb2/
