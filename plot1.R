setwd('~/exploring_data_analysis')

# Read data
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
df$Date <- as.Date(df$Date, format='%d/%m/%Y')
df$DateTime <- strptime(paste(df$Date, df$Time), format='%Y-%m-%d %H:%M:%S')
df <- df[df$Date >= as.Date('2007-02-01') & df$Date <= as.Date('2007-02-02'),]

# Plot to png
png('plot1.png')
hist(df$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()
