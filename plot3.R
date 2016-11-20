# Reading in the data

elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting the data for 2007-02-01 and 2007-02-02

elecSub <- subset(elec, Date == "1/2/2007"| Date == "2/2/2007")
elecSub$Date <- gsub("1/", "01/", elecSub$Date)
elecSub$Date <- gsub("2/", "02/", elecSub$Date)

# Converting the Date and Time columns to the appropriate class

elecSub$datetime <- as.POSIXlt(paste(elecSub$Date, elecSub$Time), format = "%d/%m/%Y %H:%M:%S")

# Opening a PNG device

png(width = 480, height = 480, file = "plot3.png")

# Creating Plot 3 with Sub meter 1

with(elecSub, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

# Adding sub meters 2 and 3 to the plot

lines(elecSub$datetime, elecSub$Sub_metering_2, col = "red")
lines(elecSub$datetime, elecSub$Sub_metering_3, col = "blue")

# Adding a legend to the plot

legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Closing the PNG device

dev.off()