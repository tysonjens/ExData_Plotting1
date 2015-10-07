## read the data into R, and subset to only the rows with dates on 01-02-2007 or 02-02-2007

household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
gcp1 <- subset(household, Date > "2007-01-31")
gcp <- subset(gcp1, Date < "2007-02-03")

## combine date and time into datetime in the POSIX formot

gcp$datetime <- paste(gcp$Date, gcp$Time)
gcp$datetime <- as.POSIXlt(gcp$datetime)

## create plot2 create in png device

plot(gcp$datetime, gcp$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
