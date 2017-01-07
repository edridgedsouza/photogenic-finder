library(dplyr)

makePlot <- function(lat, long, dist) {
  requestData <- makeRequest(latitude = lat, longitude = long, distance = dist)
  if (length(requestData) != 0){
    imageData <- summarizeRequest(requestData)
    
    p <- qmplot(source="google", maptype = "roadmap", mapcolor = "bw",
                data=imageData, 
                x = longitude, y=latitude,
                alpha = I(0)) + # Ignore the default qmplot point mapping
      geom_point(aes(longitude, latitude, size=likes, color = likes),
                 alpha = 0.7) +
      scale_colour_gradient(low = "green", high = "red")
    
    return(p)
  }
  else{
    return(NULL)
  }
}

# makePlot(lat = 42.3912, long = -72.5267, dist = 5000)