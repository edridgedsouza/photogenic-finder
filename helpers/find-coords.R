library(dplyr)
library(httr)

filename <- "./GOOGLE_TOKEN.txt"
apikey <- readChar(filename, file.info(filename)$size)

# Use Google Places API to find the coordinates given a place's name

getCoords <- function(placeName) {
  params <- list(key = apikey, query = placeName)
  
  r <-
    GET("https://maps.googleapis.com/maps/api/place/textsearch/json",
        query = params)
  parsed <- content(r, "parsed")
  if (parsed$status != "ZERO_RESULTS") {
    data <- parsed$data
    lat <- parsed$results[[1]]$geometry$location$lat
    long <- parsed$results[[1]]$geometry$location$lng
    coords <- data.frame(latitude = lat, longitude = long)
    
    return(coords)
  }
  else {
    return(FALSE)
  }
}


# Then finally use these coordinates to plug into makePlot()