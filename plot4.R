# Read data from unzipped csv in home directory
hpc <- read.csv2("household_power_consumption.txt", na.strings="?", colClasses="character")

# Get a meaniningful date format from which to use and subset for dates interested
hpc$date2 <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset dataset to dates of interest
hpcMin <- hpc[hpc$date2=="2007-2-1" | hpc$date2=="2007-2-2",]

# Additional date-time variable suitable for plotting 
hpcMin$datetime <- strptime(paste(hpcMin$Date, hpcMin$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")      

# Plotting to png device
png("plot4.png")
par("mfcol"=c(2,2))
plot(hpcMin$datetime, hpcMin$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(hpcMin$datetime, as.numeric(hpcMin$Sub_metering_1), type="n", xlab="", ylab="Energy sub meterting")
legend("topright", pch=95, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
points(hpcMin$datetime, as.numeric(hpcMin$Sub_metering_1), type="l", col="black")
points(hpcMin$datetime, as.numeric(hpcMin$Sub_metering_2), type="l", col="red")
points(hpcMin$datetime, as.numeric(hpcMin$Sub_metering_3), type="l", col="blue")
plot(hpcMin$datetime, as.numeric(hpcMin$Voltage), type="l", xlab="datetime", ylab="Voltage")
plot(hpcMin$datetime, as.numeric(hpcMin$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
