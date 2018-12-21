# Assumes the working directory contains household_power_consumption.txt

# Load power consumption dataset to memory
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

# Filter to only include rows where Date is Febuary 1st or 2nd, 2007
power <- power[as.character(power$Date) %in% c('1/2/2007','2/2/2007'),]
# Create DateTime parameter
power$DateTime <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %H:%M:%S', tz='UTC')

png('plot_4.png', width=480, height=480)
par(mfrow=c(2,2)) # Create a 2x2 plot
# Plot Global Active Power over time
plot(power$DateTime, power$Global_active_power, 
     type='l', 
     xlab='', 
     ylab='Global Active Power')
# Plot Voltage over time
plot(power$DateTime, power$Voltage, 
     type='l',
     xlab='datetime', 
     ylab='Voltage')
# Plot Sub metering 1, 2, and 3 over time
plot(power$DateTime, power$Sub_metering_1, 
     col='black', 
     type='l', 
     xlab='', 
     ylab='Energy sub metering')
lines(power$DateTime, power$Sub_metering_2, 
      col='red')
lines(power$DateTime, power$Sub_metering_3, 
      col='blue')
legend('topright', 
       col=c('black', 'red', 'blue'),
       lty=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       bty='n')
# Plot Global Reactive Power over time
plot(power$DateTime, power$Global_reactive_power, 
     type='l',
     xlab='datetime', 
     ylab='Global_reactive_power')
dev.off()