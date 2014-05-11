# Global active power histogram for 2007-02-01 and 2007-02-02

data <- read.csv( "../household_power_consumption.txt", na.strings="?", sep=";" )

# filter data rows for Feb 1 and 2, 2007.
workdata <- subset( data, grepl( '^[1-2]/2/2007', data$Date) )

# parse Date and Time into machine workable Date/Time class
workdata <- within( workdata, longTime <- strptime( paste( workdata$Date, workdata$Time, " " ), "%d/%m/%Y %H:%M:%S") )

# plot graph
png( filename="plot2.png", height = 480, width = 480 )
plot( x=workdata$longTime, y=workdata$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="" )
dev.off()