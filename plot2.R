# Read data from unzipped csv in home directory
hpc <- read.csv2("household_power_consumption.txt", na.strings="?", colClasses="character")

# Get a meaniningful date format from which to use and subset for dates interested
hpc$date2 <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset dataset to dates of interest
hpcMin <- hpc[hpc$date2=="2007-2-1" | hpc$date2=="2007-2-2",]

# Additional date-time variable suitable for plotting 
hpcMin$datetime <- strptime(paste(hpcMin$Date, hpcMin$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")      

# Plotting to png device
png("plot2.png")
plot(hpcMin$datetime, hpcMin$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()