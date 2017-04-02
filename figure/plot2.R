#Set working directory to folder containing unzipped datafile. In mycase, Rclass

setwd("./Desktop/Rclass")
library(dplyr)
library(lubridate)
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
wholedata$Date <- dmy(wholedata$Date)
subData <- filter(wholedata, Date == "2007-02-01" | Date == "2007-02-02")
subData <- mutate(subData, DateTime = paste(Date, Time, sep = " "))
subData$DateTime <- strptime(subData$DateTime, format = "%Y-%m-%d %H:%M:%S")
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
plot(subData$DateTime, subData$Global_active_power, type = "l" , ylab = "Global Active Power (kilowatts)", xlab = "")

#save plot as png
png(filename = "./ExData_plotting1/figure/plot2.png", units = "px", width = 480, height = 480)
plot(subData$DateTime, subData$Global_active_power, type = "l" , ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()