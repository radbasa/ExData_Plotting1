# Global active power, voltage, energy sub metering, global reactive power graphs for 2007-02-01 and 2007-02-02

data <- read.csv( "../household_power_consumption.txt", na.strings="?", sep=";" )

# filter data rows for Feb 1 and 2, 2007.
workdata <- subset( data, grepl( '^[1-2]/2/2007', data$Date) )

# parse Date and Time into machine workable Date/Time class
workdata <- within( workdata, longTime <- strptime( paste( workdata$Date, workdata$Time, " " ), "%d/%m/%Y %H:%M:%S") )

# plot graph
png( filename="plot4.png", height = 480, width = 480 )
par( mfrow = c(2,2) )

# time vs Global Active Power
plot( x=workdata$longTime, y=workdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# time vs voltage
plot( x=workdata$longTime, y=workdata$Voltage, type="l", ylab="Voltage", xlab="datetime")

# time vs submetering 1 to 3
plot( x=workdata$longTime, y=workdata$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", col="black" )
lines( x=workdata$longTime, y=workdata$Sub_metering_2, col="red")
lines( x=workdata$longTime, y=workdata$Sub_metering_3, col="blue")
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty=c(1,1), col=c("black","red","blue"), bty="n" )

# time vs global reactive power
plot( x=workdata$longTime, y=workdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", col="black")

dev.off()