source("loadData.R")

df <- loadData()

# open PNG file
png("plot4.png", width=480, height=480, units = "px")

# make a 2x2 grid of plots
par(mfrow=c(2,2))

# plot [1,1]
plot(df$Time,
     df$Global_active_power,
     type = "l",
     col="black",
     ylab="Global Active Power",
     xlab="")

# plot [1,2]
plot(df$Time,
     df$Voltage,
     type = "l",
     ylab="Voltage",
     xlab="datetime")

# plot [2,1]
plot(df$Time,
     df$Sub_metering_1,
     type = "l",
     col="black",
     ylab="Energy sub metering",
     xlab="")

lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1,
       box.lwd=0)

# plot [2,2]

plot(df$Time,
     df$Global_reactive_power,
     type = "l",
     ylab="Global_reactive_power",
     xlab="datetime")

# close file
dev.off()

print("Done printing")
