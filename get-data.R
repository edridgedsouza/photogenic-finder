library(dplyr)
library(httr)

fileName <- "./TOKEN.txt"
access.token <- readChar(fileName, file.info(fileName)$size)

makeRequest <- function(latitude, longitude, distance) {
    
  params <- list(access_token = access.token,
                   lat = latitude,
                   lng = longitude,
                    distance)
    #r <- GET("https://api.instagram.com/v1/locations/search",
    #         query = params)
      
    r <- GET("https://api.instagram.com/v1/media/search",
             query = params)
    parsed <- content(r, "parsed")
    data <- parsed$data
}

summarizeRequest <- function(parsedData){
    pictime <- lapply(X = parsedData, FUN = function(x) x$created_time) %>% as.numeric()
    lats <- lapply(X = parsedData, FUN = function(x) x$location$latitude) %>% as.numeric()
    longs <- lapply(X = parsedData, FUN = function(x) x$location$longitude) %>% as.numeric()
    numlikes <- lapply(X = parsedData, FUN = function(x) x$likes$count) %>% as.numeric()
    alltags <- lapply(X = parsedData, FUN = function(x) x$tags) %>% as.character()
    
    coords <- data.frame(time = pictime, latitude = lats, longitude = longs, likes = numlikes, tags = alltags)
    
    return(coords)
}
