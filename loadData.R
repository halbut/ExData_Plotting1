verbose <- TRUE

loadData <- function() {
   url<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
   zippedDataFile <- "exdata-data-household_power_consumption.zip"
   dataFile <- "household_power_consumption.txt"

   if (!file.exists(dataFile)) {
      if(!file.exists(zippedDataFile)){
         print("Downloading data file")
         download.file(url, destfile = zippedDataFile)
      }
      print("Unzipping data file")
      unzip(zippedDataFile)
   }

   data <- read.table( dataFile,
                       header = TRUE, 
                       sep= ";", 
                       na.strings = "?", 
                       colClasses = c(rep("character",2), rep("numeric",7)) )

   data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

   # We will only be using data from the dates 2007-02-01 and 2007-02-02
   data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

   if (verbose) {
      # Get a sense of the data:
      head(data)
      tail(data)
   }

   print("Done loading the data")

   return(data)
}
