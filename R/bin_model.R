#' bin_model: Binarize a model using a threshold
#'
#' @description Function to binarize a continuous model given a threshold
#'
#' @param model A continuous raster model of suitability values
#' @param occs Occurrence data with two columns (longitude and latitude).
#' @param percent Type of thresholding method. Values go from 0-100 percent
#' of the data. 0 is equivalent to the minimum training presence.
#' @return A binary map of the prediction.
#' @examples
#' \dontrun{
#'
#' model_p <- system.file("extdata/rasters/ambystoma_model.tif",
#'                        package = "ntbbox")
#' model <- raster::raster(model_p)

#' data_p <- system.file("extdata/csv/ambystoma_validation.csv",
#'                       package = "ntbbox")
#' data <- read.csv(data_p)

#' occs <- data[which(data$presence_absence==1),]

#' binary <- bin_model(model,occs[,1:2],percent = 10)

#' raster::plot(binary)
#' }
#' # Example with data of the giant hummingbird
#' r1_path <- system.file("extdata/rasters/p_gigas.tif",
#'                        package = "ntbbox")
#' r1 <- raster::raster(r1_path)
#' pgig_p <- system.file("extdata/csv/p_gigas.csv",
#'                       package = "ntbbox")
#' pgig <- read.csv(pgig_p)
#' pgig <- pgig[pgig$type=="train",]
#' bin_pg <- bin_model(r1,pgig[,2:3],percent = 15)
#' raster::plot(bin_pg)

#' @export

bin_model <- function(model,occs,percent){
  suits <- sort(stats::na.omit(raster::extract(model,occs)))
  prop <- percent/100
  npoints <- length(suits)
  nsuits <- npoints *prop
  int_npoints <- round(nsuits)
  if(int_npoints<npoints && npoints>10){
    thpos <- ceiling(nsuits)
  }
  else{
    thpos <- int_npoints
  }
  th <- suits[thpos]
  mod_bin <- model >= th
  return(mod_bin)

}
