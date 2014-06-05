## Coursera - Exploratory Data Analysis - Project 1 - 6.3.14

## Pull in the data
setwd("C:/Users/Preston/Desktop/Coursera/Exploratory Data Analysis")
data <- read.table("Data/household_power_consumption.txt", header=T, sep=";")

# limit data to February 1-2, 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## plot 3: time series plot of 3 sub meterings

# convert metrics to numeric
data3 <- transform(data, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                   Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                   Sub_metering_3 = as.numeric(as.character(Sub_metering_3)),
                   datetime = strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# send plot to png
png(file = "./Projects/Project 1 - Recreate Base Plots/plot3.png", width=480, height=480)

plot(data3$datetime,data3$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering",axis=NULL)
lines(data3$datetime,data3$Sub_metering_2, col="red")
lines(data3$datetime,data3$Sub_metering_3, col="blue")
legend("topright", legend = paste0("Sub_metering_",1:3), col = c("black","red","blue"),lty = 1)

dev.off()