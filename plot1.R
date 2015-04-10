#IMPORTANT:  The household_power_consumption.txt file must be in your working directory.
p1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

library(datasets)

p1s <-  p1[as.Date(p1$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

png("plot1.png", width=480, height=480)

hist(as.numeric(as.character(p1s$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
