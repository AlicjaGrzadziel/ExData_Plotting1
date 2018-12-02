# getting data
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# subsetting data
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
# changing the date and time formats
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")
# plotting the data and saving the plot as a .png file
# since my RStudio is running in Polish, the abbreviations of the days of the week (czw, ptk, sob) are also in Polish
png(filename="plot1.png", width=480, height=480)

with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red"))
     
dev.off()