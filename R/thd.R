#' Thresholding model predictions
#' @export
#' @import raster
#' @param sdm ENM suitability prediction
#' @param occ Occ of long and lat
#' @param type mtp,p10
thd <- function(sdm, occ, type = ""){
  occPredVals <- raster::extract(sdm, occ)
  if(type == "mtp"){
    thresh <- min(na.omit(occPredVals))
  } else if(type == "p10"){
    if(length(occPredVals) < 10){
      p10 <- floor(length(occPredVals) * 0.9)
    } else {
      p10 <- ceiling(length(occPredVals) * 0.9)
    }
    thresh <- rev(sort(occPredVals))[p10]
  }
  
  else if(type == "p5"){
    if(length(occPredVals) < 5){
      p5 <- floor(length(occPredVals) * 0.95)
    } else {
      p5 <- ceiling(length(occPredVals) * 0.95)
    }
    thresh <- rev(sort(occPredVals))[p5]
  }
  sdm_thresh <- sdm
  sdm_thresh[sdm_thresh < thresh] <- NA
  sdm_thresh[sdm_thresh >= thresh] <- 1
  return(sdm_thresh)
}


