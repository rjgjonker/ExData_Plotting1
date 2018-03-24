plot1 <- function(datafile = "../household_power_consumption.txt") {
	# Load the dplyr library
	library(dplyr)
	
	# Load the full data set
	df <- read.csv(datafile, sep = ";", na.strings = '?')
	
	# Take only the relevant dates
	df <- filter(df, Date=="1/2/2007" | Date=="2/2/2007")
	
	# Make the plot
	png(filename = "plot1.png", width = 480, height = 480)
	hist(df$Global_active_power, breaks = 12, col = "red",
		 xlab = "Global Active Power (kilowatts)",
		 ylab = "Frequency", main = "Global Active Power")
	dev.off()
}