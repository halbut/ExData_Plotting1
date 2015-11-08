source("loadData.R")

df <- loadData()

# open PNG file
png("plot3.png", width=480, height=480, units = "px")

plot(df$Time,
     df$Sub_metering_1,
     type = "l",
     col="black",
     ylab="Energy sub metering",
     xlab="")

lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")

legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)


# close file
dev.off()

print("Done printing")
