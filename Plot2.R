power <- read.table("power.txt",sep = ";",header = T, na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
dateTime <- paste(power$Date, power$Time)
power <- power[,-which(names(power) == c("Date", "Time"))] #remove the initial Date and Time column
power$dateTime <- strptime(power$dateTime,"%Y-%m-%d %H:%M:%S") #convert to "POSIXlt" and "POSIXt"

png("./Plots/Plot2.png", width = 480, height = 480)
plot(power$dateTime, power$Global_active_power, type = "S", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()

