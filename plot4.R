
power_com <- read.table("power_consumption/household_power_consumption.txt",sep = ";",header = T,
                        stringsAsFactors = F,dec = ".")



subsetted <- power_com[power_com$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submet1 <- as.numeric(subsetted$Sub_metering_1)
submet2 <- as.numeric(subsetted$Sub_metering_2)
submet3 <- as.numeric(subsetted$Sub_metering_3)
voltage <- as.numeric(subsetted$Voltage)
activePower <- as.numeric(subsetted$Global_active_power)
reactPower <- as.numeric(subsetted$Global_reactive_power)

png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
#first plot
plot(datetime,activePower,type = "l",ylab="Global Active Power (Kilowatts)",xlab = "")

#Second plot
plot(datetime,voltage,ylab = "Voltage",type = "l")

#third plot
plot(datetime,submet1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(datetime,submet2,type = "l",col="red")
lines(datetime,submet3,type = "l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,
       lwd = 2, col = c("black","red","blue"))

#fourth plot
plot(datetime,reactPower,ylab = "Global_Reactive_Power",type = "l")

dev.off()
