#IMPORTANT:  The household_power_consumption.txt file must be in your working directory.

p1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

library(datasets)

p1s <-  p1[as.Date(p1$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

p1s$newtime <- as.POSIXct(paste(p1s$Date, p1s$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

with(p1s,plot(as.POSIXct(p1s$newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
