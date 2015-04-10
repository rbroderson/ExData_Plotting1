#IMPORTANT:  The household_power_consumption.txt file must be in your working directory.

p1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

library(datasets)

p1s <-  p1[as.Date(p1$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

p1s$newtime <- as.POSIXct(paste(p1s$Date, p1s$Time), format="%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

#Create plot A

with(p1s,plot(as.POSIXct(p1s$newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)"))


#Create plot B

with (p1s, plot(as.POSIXct(newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(Voltage)), type="l", ylab='Voltage', xlab='datetime'))


#Create plot C

with (p1s, plot(as.POSIXct(newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(Sub_metering_1)), type="l", xlab='', ylab='Energy sub metering'))
lines(as.POSIXct(p1s$newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(p1s$Sub_metering_2)), type="l", xlab='', ylab='', col="red")
lines(as.POSIXct(p1s$newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(p1s$Sub_metering_3)), type="l", xlab='', ylab='', col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

#Create plot D

with (p1s, plot(as.POSIXct(newtime, '%Y/%m/%d %H:%M:%S'), as.numeric(as.character(Global_reactive_power)), type="l", ylab='Global_reactive_power', xlab='datetime'))


dev.off()

