library(dplyr)
library(httr)

fileName <- "./GOOGLE_TOKEN.txt"
apikey <- readChar(fileName, file.info(fileName)$size)

# First use Google Places API to find the placename identifier
# https://developers.google.com/places/place-id
# Then reverse geocode the place ID to get an address
# Then geocode the address again to get coordinates
# https://developers.google.com/maps/documentation/geocoding/intro#ReverseGeocoding


# Then finally use these coordinates to plug into makePlot()