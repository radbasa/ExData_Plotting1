# Global active power histogram for 2007-02-01 and 2007-02-02

data <- read.csv( "../household_power_consumption.txt", na.strings="?", sep=";" )

# filter data rows for Feb 1 and 2, 2007.
workdata <- subset( data, grepl( '^[1-2]/2/2007', data$Date) )

# plot histogram
png( filename="plot1.png", height = 480, width = 480 )
hist( workdata$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)" )
dev.off()