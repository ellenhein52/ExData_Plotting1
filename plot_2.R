# Assumes the working directory contains household_power_consumption.txt

# Load power consumption dataset to memory
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

# Filter to only include rows where Date is Febuary 1st or 2nd, 2007
power <- power[as.character(power$Date) %in% c('1/2/2007','2/2/2007'),]
# Create DateTime parameter
power$DateTime <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %H:%M:%S', tz='UTC')


png('plot_2.png', width=480, height=480)
plot(power$DateTime, power$Global_active_power, 
     type='l', 
     xlab='Time', 
     ylab='Global Active Power (kilowatts)',
     main='Global Active Power Over Time')
dev.off()