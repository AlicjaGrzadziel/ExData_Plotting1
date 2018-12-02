# getting data
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# subsetting data
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
# changing the date and time formats
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")
# plotting the data and saving the plot as a .png file
# since my RStudio is running in Polish, the abbreviations of the days of the week (czw, ptk, sob) are also in Polish
png(filename="plot3.png", width=480, height=480)

with(data, plot(DateTime,Sub_metering_1, main="", ylab='Energy sub metering', type='l',xlab=""))
with(data, lines(DateTime, Sub_metering_2, col='red'))
with(data, lines(DateTime, Sub_metering_3, col='blue'))
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),lwd=2,col=c("black","red","blue"))

dev.off()


