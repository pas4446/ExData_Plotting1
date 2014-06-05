## Coursera - Exploratory Data Analysis - Project 1 - 6.3.14

## Pull in the data
setwd("C:/Users/Preston/Desktop/Coursera/Exploratory Data Analysis")
data <- read.table("Data/household_power_consumption.txt", header=T, sep=";")

# limit data to February 1-2, 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## plot 1: histogram of global active power

# convert global active power to numeric
data1 <- transform(data, Global_active_power = as.numeric(as.character(Global_active_power)))

# now the histogram
png(file = "./Projects/Project 1 - Recreate Base Plots/plot1.png", width=480, height=480)

hist(data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

dev.off()