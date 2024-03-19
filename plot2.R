# Read in and re-name electric power consumption data according to needs. Define the date subset time period of interest (two day window)

power <- read.table("household_power_consumption.txt",  , na.strings="?")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


# Transform the date and time variables from characters to objects of type Date and POSIXlt respectively

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plot the graph

plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# add a title

title(main="Global Active Power Vs Time")

# create a png version
dev.copy(png, filename="plot2.png")
dev.off()
