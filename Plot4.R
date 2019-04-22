power <- read.table("power.txt",sep = ";",header = T, na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
dateTime <- paste(power$Date, power$Time)
power <- power[,-which(names(power) == c("Date", "Time"))] #remove the initial Date and Time column
power$dateTime <- strptime(power$dateTime,"%Y-%m-%d %H:%M:%S") #convert to "POSIXlt" and "POSIXt"

par(mfcol = c(2, 2))
#first plot
plot(power$dateTime, power$Global_active_power, type = "S", xlab = "", ylab = "Global Active Power")

#second plot
plot(power$dateTime, power$Sub_metering_1,type="S",col="black", xlab = "",ylab = "Energy sub metering")
lines(power$dateTime,power$Sub_metering_2,col="red")
lines(power$dateTime,power$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, cex=0.5)

#third plot
plot(power$dateTime, power$Voltage, type = "S", xlab = "datetime", ylab = "Voltage")

#fourth plot
plot(power$dateTime, power$Global_reactive_power, type = "S", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
dev.cur()
