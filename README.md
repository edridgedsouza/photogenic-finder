# photogenic-finder
Use Instagram geotag API to find the most photogenic parts of a college campus or city

## How to
Use the Instagram Developer settings to get yourself an access token. Save this Instagram access token as plain text in the file `TOKEN.txt` in the root directory of this project. For the app to be useful, you need to set it up with `public_content` access and then submit a request to Instagram to take it out of sandbox mode. You will also need a Google API key for the Maps Geocoding API, which you should save in `GOOGLE_TOKEN.txt`.