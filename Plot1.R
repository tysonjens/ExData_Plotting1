## read the data into R, and subset to only the rows with dates on 01-02-2007 or 02-02-2007

household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
gcp1 <- subset(household, Date > "2007-01-31")
gcp <- subset(gcp1, Date < "2007-02-03")

## create plot1 create in png device

hist(gcp$Global_active_power, col = "red")

hist(gcp$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
