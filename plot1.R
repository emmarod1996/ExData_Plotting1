library(lubridate)

#Reading the file
power_com <- read.table("power_consumption/household_power_consumption.txt",sep = ";",header = T,
                        stringsAsFactors = F)

power_com$Date <- dmy(power_com$Date)
subsetted <- power_com[power_com$Date=="2007-02-01" | power_com$Date=="2007-02-02", ]

subsetted$Global_active_power <- as.numeric(subsetted$Global_active_power)

  

png("plot1.png")
hist(subsetted$Global_active_power, xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power",col = "red")
dev.off()
