##Loading the data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

###subseting data to reduce performance hindrance
power_subset <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
power_subset$Date <- as.Date(power_subset$Date, format="%d/%m/%Y")
power_subset$Time <- strptime(power_subset$Time, format="%H:%M:%S")
power_subset[1:1440,"Time"] <- format(power_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_subset[1441:2880,"Time"] <- format(power_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# 4 different plots as per requirement to fit in 4 places
  plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpower$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower$Time,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")


# copy the plot to png with 480 * 480 pixels

dev.copy(png,'plot4.png',width = 480, height = 480, units = "px")

dev.off()


