## read the data into R, and subset to only the rows with dates on 01-02-2007 or 02-02-2007

household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
gcp1 <- subset(household, Date > "2007-01-31")
gcp <- subset(gcp1, Date < "2007-02-03")

par(mfcol = c(2,2))
plot(gcp$datetime, gcp$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(gcp$datetime, gcp$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(gcp$datetime, gcp$Sub_metering_2, col = "red")
lines(gcp$datetime, gcp$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
plot(gcp$datetime, gcp$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(gcp$datetime, gcp$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png")
dev.off()
