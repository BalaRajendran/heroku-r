library(plumber)

port <- Sys.getenv('PORT')

r <- plumb("./myfile.R")

r$run(host='0.0.0.0', port=strtoi(port))
