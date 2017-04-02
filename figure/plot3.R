#Set working directory to folder containing unzipped datafile. In mycase, Rclass

setwd("./Desktop/Rclass")
library(dplyr)
library(lubridate)
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
wholedata$Date <- dmy(wholedata$Date)
subData <- filter(wholedata, Date == "2007-02-01" | Date == "2007-02-02")
subData <- mutate(subData, DateTime = paste(Date, Time, sep = " "))
subData$DateTime <- strptime(subData$DateTime, format = "%Y-%m-%d %H:%M:%S")
subData$Sub_metering_1 <- as.numeric(as.character(subData$Sub_metering_1))
subData$Sub_metering_2 <- as.numeric(as.character(subData$Sub_metering_2))
plot(subData$DateTime, subData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = "solid")

#plotting as png
png(filename = "./ExData_plotting1/figure/plot3.png", units = "px", width = 480, height = 480)
plot(subData$DateTime, subData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = "solid")
dev.off()
