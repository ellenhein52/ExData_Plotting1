# Assumes the working directory contains household_power_consumption.txt

# Load power consumption dataset to memory
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

# Create histogram of Global Active Power
png('plot_1.png', width=480, height=480)
hist(power$Global_active_power, 
     col='red', 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)')
dev.off()
