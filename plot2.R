plot2 <- function(datafile = "../household_power_consumption.txt") {
	# Load the dplyr library
	library(dplyr)
	
	# Load the full data set
	df <- read.csv(datafile, sep = ";", na.strings = '?')
	
	# Take only the relevant dates
	df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")
	
	# Merge the date and time columns
	df <- mutate(df, DateTime = as.POSIXct(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")))
	
	# Make the plot
	png(filename = "plot2.png", width = 480, height = 480)
	plot(df$DateTime, df$Global_active_power, type = "l",
		 xlab = "", ylab = "Global Active Power (kilowatts)")
	dev.off()
}