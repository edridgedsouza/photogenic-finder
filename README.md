# photogenic-finder
Use Instagram geotag API to find the most photogenic parts of a college campus or city

## How to
Use the Instagram Developer settings to get yourself an access token. Save this Instagram access token as plain text in the file `TOKEN.txt` in the root directory of this project. For the app to be useful, you need to set it up with `public_content` access and then submit a request to Instagram to take it out of sandbox mode. You will also need a Google API key for the Maps Geocoding API, which you should save in `GOOGLE_TOKEN.txt`, also in the root directory. It's best if your Instagram API key is registered as Live rather than Sandbox, because this allows you to see a greater amount of data.

To run the app, run RStudio and open up `server.R` and/or `ui.R`. Click the "Run App" button to activate.