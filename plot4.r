## Remember to go to your working directory with the "household_power_consumption.txt" file

## Read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFActors=FALSE)

## Convert Date column from character class to date class
data$Date = as.Date(data$Date, "%d/%m/%Y")

## Subset data frame to only 2007-02-01 and 2007-02-02
data2 = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## Convert Time column from character class to time class
data2$Time = strptime(data2$Time, format = "%H:%M:%S")

## Add datetime column to combine date & time.  Note that Date column is in date class and Time column is in character class
data2$datetime = paste(data2$Date, data2$Time)
data2$datetime = as.POSIXct(data2$datetime)

## Plot fourth plot
par(mfrow = c(2,2))

plot(data2$datetime2, data2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
plot(data2$datetime2, data2$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(data2$datetime2, data2$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(data2$datetime2, data2$Sub_metering_2, col="red")
lines(data2$datetime2, data2$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch="", lwd=2, cex=.5)
plot(data2$datetime2, data2$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.copy(png, file="plot4.png")

dev.off()