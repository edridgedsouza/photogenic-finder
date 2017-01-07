library(dplyr)
library(httr)

fileName <- "./TOKEN.txt"
access.token <- readChar(fileName, file.info(fileName)$size)

getLocationIDs <- function(latitude = 48.858844, longitude = 2.294351) {
    
  params <- list(access_token = access.token,
                   lat = latitude,
                   lng = longitude)
    r <- GET("https://api.instagram.com/v1/locations/search",
             query = params)
    
    parsed <- content(r, "parsed")
    data <- parsed$data
    
    numResults <- length(data)
    placeIDs <-
      lapply(
        X = data,
        FUN = function(x) x$id
      ) %>% as.character()
    
    return(placeIDs)
}


