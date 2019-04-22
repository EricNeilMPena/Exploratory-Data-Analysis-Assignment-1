power <- read.table("power.txt",sep = ";",header = T, na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
dateTime <- paste(power$Date, power$Time)
power <- power[,-which(names(power) == c("Date", "Time"))] #remove the initial Date and Time column
power$dateTime <- strptime(power$dateTime,"%Y-%m-%d %H:%M:%S") #convert to "POSIXlt" and "POSIXt"

png("./Plots/Plot1.png", width = 480, height = 480)
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active power (kilowatts)", col = "red")
dev.off()



