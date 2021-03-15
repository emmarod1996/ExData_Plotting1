library(lubridate)

#Reading the file
power_com <- read.table("power_consumption/household_power_consumption.txt",sep = ";",header = T,
                        stringsAsFactors = F)


subsetted <- power_com[power_com$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activePower <- as.numeric(subsetted$Global_active_power)


png("plot2.png",width = 480,height = 480)
plot(datetime,activePower,type = "l",ylab="Global Active Power (Kilowatts)",xlab = "")
dev.off()
