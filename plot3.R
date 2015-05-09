

# Read data file
setwd("C:/Users/daniel.ibanez/Google Drive/Coursera/Data Analysis/Project 1")
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", na.strings="?")
# Change Date column from character to date
data$Date = as.Date(data$Date,"%d/%m/%Y")
# Filter out only the data required (2 days)
data <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]
# # Change Time column from character to date/time combo
data$Time <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")


# Initialize the device for a PNG 
png( "plot3.png", width=480, height=480, bg="white")
# Plot the lines
plot( data[,"Time"],data[,"Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
points( data[,"Time"],data[,"Sub_metering_2"], type="l",col="red")
points( data[,"Time"],data[,"Sub_metering_3"], type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1, 1, 1), col=c("black","red","blue"))
# Plot is done. Close the device
dev.off()

