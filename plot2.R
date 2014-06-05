## Coursera - Exploratory Data Analysis - Project 1 - 6.3.14

## Pull in the data
setwd("C:/Users/Preston/Desktop/Coursera/Exploratory Data Analysis")
data <- read.table("Data/household_power_consumption.txt", header=T, sep=";")

# limit data to February 1-2, 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## plot 2: time series plot of global active power

# convert global active power to numeric
data2 <- transform(data, Global_active_power = as.numeric(as.character(Global_active_power)),
                         datetime = strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# send the plot to a png file
png(file = "./Projects/Project 1 - Recreate Base Plots/plot2.png", width=480, height=480)

plot(data2$datetime,data2$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()