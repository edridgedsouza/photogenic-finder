library(dplyr)
library(httr)

fileName <- "./TOKEN.txt"
access.token <- readChar(fileName, file.info(fileName)$size)

makeRequest <- function(latitude = 48.858844, longitude = 2.294351) {
    
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

requestData <- makeRequest(latitude = 42.3912, longitude = -72.5267)
imageData <- summarizeRequest(requestData)
