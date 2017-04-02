#Set working directory to folder containing unzipped datafile. In mycase, Rclass

setwd("./Desktop/Rclass")
library(lubridate)
library(dplyr)
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
wholedata$Date <- dmy(wholedata$Date)
subData <- filter(wholedata, Date == "2007-02-01" | Date == "2007-02-02")
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
par(mfrow = c(1,1))
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

png(filename = "./ExData_plotting1/figure/plot1.png",width = 480, height = 480, units = "px")
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
