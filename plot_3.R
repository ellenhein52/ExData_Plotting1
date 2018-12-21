# Assumes the working directory contains household_power_consumption.txt

# Load power consumption dataset to memory
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

# Filter to only include rows where Date is Febuary 1st or 2nd, 2007
power <- power[as.character(power$Date) %in% c('1/2/2007','2/2/2007'),]
# Create DateTime parameter
power$DateTime <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %H:%M:%S', tz='UTC')

# Plot multiple lines on plot with legend
png('plot_3.png', width=480, height=480)
plot(power$DateTime, power$Sub_metering_1, 
     col='black', 
     type='l', 
     xlab='Time', 
     ylab='Energy sub metering')
lines(power$DateTime, power$Sub_metering_2, 
      col='red')
lines(power$DateTime, power$Sub_metering_3, 
      col='blue')
legend('topright', 
       col=c('black', 'red', 'blue'),
       lty=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()