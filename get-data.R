library(dplyr)
library(httr)

fileName <- "./TOKEN.txt"
access.token <- readChar(fileName, file.info(fileName)$size)

getCoords <- function(latitude = 48.858844, longitude = 2.294351) {
    
  params <- list(access_token = access.token,
                   lat = 42.3912, # latitude
                   lng = -72.5267, # longitude
                    distance = 5000)
    #r <- GET("https://api.instagram.com/v1/locations/search",
    #         query = params)
      
    r <- GET("https://api.instagram.com/v1/media/search",
             query = params)
    parsed <- content(r, "parsed")
    data <- parsed$data
    
    numResults <- length(data)
    lats <-
      lapply(
        X = data,
        FUN = function(x) x$location$latitude
      ) %>% as.numeric()
    longs <- lapply(
      X = data,
      FUN = function(x) x$location$longitude
    ) %>% as.numeric()
    
    coords <- data.frame(latitude = lats, longitude = longs)
    
    return(coords)
}

coords <- getCoords(latitude = 42.3912, longitude = -72.5267)
