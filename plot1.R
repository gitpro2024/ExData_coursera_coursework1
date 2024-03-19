#Set the working directory
setwd("~/R/Coursera/exdata%2Fdata%2Fhousehold_power_consumption")

#Read in and name the data. define the subset of interest (the two day window 2007-02-01 to 2007-02-02)

power <- read.table("household_power_consumption.txt", na.strings="?"))
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#plot the data as a histogram
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#add a title to the graph
title(main="Global Active Power")

#create a .png version of the graph
dev.copy(png, filename="plot1.png")
dev.off()
