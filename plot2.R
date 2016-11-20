# Reading in the data

elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting the data for 2007-02-01 and 2007-02-02

elecSub <- subset(elec, Date == "1/2/2007"| Date == "2/2/2007")
elecSub$Date <- gsub("1/", "01/", elecSub$Date)
elecSub$Date <- gsub("2/", "02/", elecSub$Date)

# Converting the Date and Time columns to the appropriate class

elecSub$datetime <- as.POSIXlt(paste(elecSub$Date, elecSub$Time), format = "%d/%m/%Y %H:%M:%S")

# Opening a PNG device

png(width = 480, height = 480, file = "plot2.png")

# Creating Plot 2 on the screen device

with(elecSub, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Closing the PNG device

dev.off()