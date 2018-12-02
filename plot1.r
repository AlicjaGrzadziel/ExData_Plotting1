# getting data
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# subsetting data
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
# plotting the data and saving the plot as a .png file
png(filename="plot1.png", width=480, height=480)
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")) 
dev.off()
