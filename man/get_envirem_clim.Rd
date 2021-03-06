% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_envirem_clim.R
\name{get_envirem_clim}
\alias{get_envirem_clim}
\title{get_envirem_clim: Get bioclimatic data from envirem}
\usage{
get_envirem_clim(
  period,
  gcm = NULL,
  region,
  resolution,
  fmt,
  sv_dir = getwd(),
  load2r
)
}
\arguments{
\item{period}{Period. Possible values are: "current" ( 1960 - 1990),"holo" (Mid-Holocene ~ 6000 years ago),"lgm" (Last Glacial Maximum ~ 22000 years ago).}

\item{gcm}{Global circulation model. Posible values: NULL, "ccsm4", "miroc_esm", and, "mpi_esm_p".}

\item{region}{Geographic region. Posibles values are: "Africa", "Australia", "Eurasia", "Europe", "global", "NAmerica", "NewWorld", "Pacific", and, "SAmerica".}

\item{resolution}{Resolution of layers. Posible values are "10arcmin","5arcmin","2.5arcmin", and, "30arcsec".}

\item{fmt}{File format. Possible values are "bil" and "geotiff".}

\item{sv_dir}{Path to the directory where the layers will be saved. The default is the working directory of the R session.}

\item{load2r}{Logical. Load layers into R?}
}
\description{
Get bioclimatic layers from ENVIREM for present and past scenarios
}
\details{
For more details visit \url{https://envirem.github.io/}
}
\examples{
\dontrun{
# For a compleate list of posible values of the function
# for current period
# clim_data_current <- base::readRDS(file.path(system.file("extdata/rds",
#                                                   package = "ntBbox"),
#                                                  "envirem_clim_current.rds"))
# For a compleate list of posible values of the function
# for pass perids (holo,lgm)

clim_eu_lgm_ccsm4_10min <- get_envirem_clim(period="lgm",
                                            gcm="ccsm4",
                                            region="Europe",
                                            resolution= "10arcmin",
                                            fmt ="geotiff",
                                            sv_dir = "~/Desktop",
                                            load2r=TRUE)
}
}
\references{
Title P.O., Bemmels J.B. 2018. ENVIREM: an expanded set of bioclimatic and topographic variables increases flexibility and improves the performance of ecological niche modeling. Ecography. 41:291-307.
}
\seealso{
\code{\link[ntbbox]{get_chelsa}}, \code{\link[ntbbox]{get_envirem_elev}},
\code{\link[ntbbox]{get_bio_oracle}}.
}
