##Loading the data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

###subseting data to reduce performance hindrance
power_subset <- subset(power,power$Date == "1/2/2007" | power$Date == "2/2/2007")


## histogram to show Global_active_power versus frequency graph
hist(as.numeric(as.character(power_subset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# copy the plot to png with 480 * 480 pixels

dev.copy(png,'plot1.png',width = 480, height = 480, units = "px")

dev.off()
