setwd('~/exploring_data_analysis')

# Read data
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                 na.strings='?')
df$Date <- as.Date(df$Date, format='%d/%m/%Y')
df <- df[df$Date >= as.Date('2007-02-01') & df$Date <= as.Date('2007-02-02'),]

# Plot to png
png(filename='plot3.png', width=480, height=480, units='px')
plot(df$Sub_metering_1, type='l', xaxt='n', xlab='', ylab='Energy sub metering')
lines(x=df$Sub_metering_2, col='red')
lines(x=df$Sub_metering_3, col='blue')
axis(1, at=c(0, as.integer(nrow(df)/2), nrow(df)), labels=c('Thu','Fri','Sat'))
legend('topright', lty=1, col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()