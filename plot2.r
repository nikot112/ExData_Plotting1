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

## Plot second plot
png(filename = "plot2.png", width=480, height=480)

plot(data2$datetime2, data2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()