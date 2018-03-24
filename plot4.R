plot4 <- function(datafile = "../household_power_consumption.txt") {
	# Load the dplyr library
	library(dplyr)
	
	# Load the full data set
	df <- read.csv(datafile, sep = ";", na.strings = '?')
	
	# Take only the relevant dates
	df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")
	
	# Merge the date and time columns
	df <- mutate(df, DateTime = as.POSIXct(strptime(paste(Date, Time),
													format = "%d/%m/%Y %H:%M:%S")))
	
	# Setup plot environment
	png(filename = "plot4.png", width = 480, height = 480)
	par(mfrow=c(2,2))

	# First plot
	plot(df$DateTime, df$Global_active_power, type = "l",
		 xlab = "", ylab = "Global Active Power")

	# Second plot	
	plot(df$DateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
	
	# Third plot	
	plot(df$DateTime, df$Sub_metering_1, type = "l",
		 xlab = "", ylab = "Energy sub metering")
	lines(df$DateTime, df$Sub_metering_2, col = "red")
	lines(df$DateTime, df$Sub_metering_3, col = "blue")
	legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		   col = c("black", "red", "blue"), lwd=1, bty = "n")

	# Fourth plot	
	plot(df$DateTime, df$Global_reactive_power, type = "l", xlab = "datetime",
		 ylab = "Global_reactive_power")
	
	# Close the device (and write the file)
	dev.off()
}