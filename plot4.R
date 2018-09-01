setwd('~/exploring_data_analysis')

# Read data
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
df$Date <- as.Date(df$Date, format='%d/%m/%Y')
df$DateTime <- strptime(paste(df$Date, df$Time), format='%Y-%m-%d %H:%M:%S')
df <- df[df$Date >= as.Date('2007-02-01') & df$Date <= as.Date('2007-02-02'),]

# Plot to png
png(filename='plot4.png', width=480, height=480, units='px')
par(mfrow=c(2,2))
plot(df$DateTime, df$Global_active_power, type='l', xlab='', ylab='Global Active Power')
plot(df$DateTime, df$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(df$DateTime, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(df$DateTime, df$Sub_metering_2, col='red')
lines(df$DateTime, df$Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty='n')
plot(df$DateTime, df$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
dev.off()
