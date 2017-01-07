library(dplyr)
source("./get-data.R")


requestData <- makeRequest(latitude = 42.3912, longitude = -72.5267)
imageData <- summarizeRequest(requestData)

p <- qmplot(source="google", maptype = "roadmap",
            data=imageData, 
            x = longitude, y=latitude,
            alpha = I(0)) + # Ignore the default qmplot point mapping
  geom_point(aes(longitude, latitude, size=likes, color = likes),
             alpha = 0.5) 

p + scale_colour_distiller(palette = "Reds")
