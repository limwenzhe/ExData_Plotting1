# Reading in the data

elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting the data for 2007-02-01 and 2007-02-02

elecSub <- subset(elec, Date == "1/2/2007"| Date == "2/2/2007")
elecSub$Date <- gsub("1/", "01/", elecSub$Date)
elecSub$Date <- gsub("2/", "02/", elecSub$Date)

# Converting the Date and Time columns to the appropriate class

elecSub$datetime <- as.POSIXlt(paste(elecSub$Date, elecSub$Time), format = "%d/%m/%Y %H:%M:%S")

# Opening a PNG device

png(width = 480, height = 480, file = "plot4.png")

# Setting up global parameters

par(mfrow = c(2,2))

# plotting the 4 charts

with(elecSub, {
        # Top left
        plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        
        # Top right
        plot(datetime, Voltage, type = "l")
        
        # Bottom left
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #Bottom right
        plot(datetime, Global_reactive_power, type = "l")
})

# Closing the PNG device

dev.off()