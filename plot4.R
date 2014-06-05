## Coursera - Exploratory Data Analysis - Project 1 - 6.3.14

## Pull in the data
setwd("C:/Users/Preston/Desktop/Coursera/Exploratory Data Analysis")
data <- read.table("Data/household_power_consumption.txt", header=T, sep=";")

# limit data to February 1-2, 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## plot 4: 4 plots together

# convert metrics to numeric
data4 <- transform(data, Global_active_power = as.numeric(as.character(Global_active_power)), 
                   Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                   Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                   Sub_metering_3 = as.numeric(as.character(Sub_metering_3)),
                   Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                   Voltage = as.numeric(as.character(Voltage)),
                   datetime = strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# send plot to png
png(file = "./Projects/Project 1 - Recreate Base Plots/plot4.png", width=480, height=480)

# set the plotting region for four plots, fill columns first
par(mfcol = c(2,2))

# plot 2
plot(data4$datetime,data4$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

# plot 3 - need to lose border on legend
plot(data4$datetime,data4$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(data4$datetime,data4$Sub_metering_2, col="red")
lines(data4$datetime,data4$Sub_metering_3, col="blue")
legend("topright", legend = paste0("Sub_metering_",1:3), col = c("black","red","blue"),
       lty = 1,bty="n")

# time series for Voltage
plot(data4$datetime,data4$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

# time series for global reactive power
plot(data4$datetime,data4$Global_reactive_power, type="l", xlab = "datetime", 
     ylab = "Global_reactive_power")

# reset the par
par(mfcol = c(1,1))

dev.off()