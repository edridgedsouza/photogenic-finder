library(dplyr)
library(httr)

fileName <- "./GOOGLE_TOKEN.txt"
apikey <- readChar(fileName, file.info(fileName)$size)

# First use Google Places API to find the placename identifier
# https://developers.google.com/places/place-id

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
}


# Then finally use these coordinates to plug into makePlot()