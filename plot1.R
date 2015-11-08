source("loadData.R")

df <- loadData()

# open PNG file
png("plot1.png", width=480, height=480, units = "px")
    
hist(df$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
    
# close file
dev.off()

print("Done printing")
