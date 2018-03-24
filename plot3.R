plot3 <- function(datafile = "../household_power_consumption.txt") {
	# Load the dplyr library
	library(dplyr)
	
	# Load the full data set
	df <- read.csv(datafile, sep = ";", na.strings = '?')
	
	# Take only the relevant dates
	df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")
	
	# Merge the date and time columns
	df <- mutate(df, DateTime = as.POSIXct(strptime(paste(Date, Time),
													format = "%d/%m/%Y %H:%M:%S")))
	
	# Make the plot
	png(filename = "plot3.png", width = 480, height = 480)
	plot(df$DateTime, df$Sub_metering_1, type = "l",
		 xlab = "", ylab = "Energy sub metering")
	lines(df$DateTime, df$Sub_metering_2, col = "red")
	lines(df$DateTime, df$Sub_metering_3, col = "blue")
	legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		   col = c("black", "red", "blue"), lwd=1)
	dev.off()
}