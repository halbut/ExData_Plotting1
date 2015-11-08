source("loadData.R")

df <- loadData()

# open PNG file
png("plot2.png", width=480, height=480, units = "px")

plot(df$Time,
     df$Global_active_power,
     type = "l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
    
# close file
dev.off()

print("Done printing")
