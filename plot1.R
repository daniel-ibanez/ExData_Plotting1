

# Read data file
setwd("C:/Users/daniel.ibanez/Google Drive/Coursera/Data Analysis/Project 1")
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings="?")
# Change Date column form character to date
data$Date = as.Date(data$Date,"%d/%m/%Y")
# Filter out only the data required (2 days)
data <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]
# Initialize the device for a PNG 
png( "plot1.png", width=480, height=480, bg="white")
# Plot the Histogram
hist(data[,"Global_active_power"], main="Global Active Power", xlab="Gloabl Active Power (kilowatts)", col="red")
# Plot is done. Close the device
dev.off()

