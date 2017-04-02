#Set working directory to folder containing unzipped datafile. In mycase, Rclass

setwd("./Desktop/Rclass/")
library(dplyr)
library(lubridate)
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
wholedata$Date <- dmy(wholedata$Date)
subData <- filter(wholedata, Date == "2007-02-01" | Date == "2007-02-02")
subData <- mutate(subData, DateTime = paste(Date, Time, sep = " "))
subData$DateTime <- strptime(subData$DateTime, format = "%Y-%m-%d %H:%M:%S")
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
subData$Sub_metering_1 <- as.numeric(as.character(subData$Sub_metering_1))
subData$Sub_metering_2 <- as.numeric(as.character(subData$Sub_metering_2))
subData$Voltage <- as.numeric(as.character(subData$Voltage))
subData$Global_reactive_power <- as.numeric(as.character(subData$Global_reactive_power))

par(mfcol = c(2,2), mar = c(5,5,3,1))
#Global Active power/Datetime graph
plot(subData$DateTime, subData$Global_active_power, type = "l" , ylab = "Global Active Power", xlab = "")
#Energy sub metering /Datetime graph
plot(subData$DateTime, subData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = "solid", bty = "n")
#Voltage/Datetime graph
plot(subData$DateTime, subData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#Global_reactive_power/Datetime graph
plot(subData$DateTime, subData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#PNG file
png(filename = "./ExData_plotting1/figure/plot4.png", units = "px", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(5,5,3,1))
plot(subData$DateTime, subData$Global_active_power, type = "l" , ylab = "Global Active Power", xlab = "")
plot(subData$DateTime, subData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = "solid", bty = "n")
plot(subData$DateTime, subData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(subData$DateTime, subData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
