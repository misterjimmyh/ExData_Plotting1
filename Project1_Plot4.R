#####################################################################################
##                                                                                 ##
##                                                                                 ##
## Exploratory Data Analysis                                                       ##
## Project 1 - Code for plot4.png                                                  ##
##                                                                                 ##
## Written by MisterJimmyH                                                         ##
##                                                                                 ##
##                                                                                 ##
#####################################################################################

##PNG file output saved with transparent background to match requested output!!!

## Reading the data into R:
data <- read.table(file="C:\\R_WORKING_DIRECTORY\\_Data Science Specialist\\Course 04 Exploratory Data Analysis\\household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

##Subsetting the entire dataset (by the two requested dates) into a working R object:
workingdata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

##Converting the dates to Date Format and assigning to original working R object:
workingdata <- cbind(Date2 = strptime(paste(workingdata$Date, workingdata$Time), "%d/%m/%Y %T"), workingdata)

##PLOTTING THE REQUESTED GRAPH
####Setting up the mfrow to accomodate four graphs
par(mfrow = c(2,2))

####PART 1: Plotting the graphs (Line and legend generated code is indented and follows appropriate graphs):
with(workingdata,
	{
	plot(x=workingdata$Date2, y=workingdata$Global_active_power, pch = "", xlab = "", ylab = "Global Active Power")
		lines(x=workingdata$Date2, y=workingdata$Global_active_power)
	
	plot(x=workingdata$Date2, y=workingdata$Voltage, pch = "", xlab = "datetime", ylab = "Voltage")
		lines(x=workingdata$Date2, y=workingdata$Voltage)
	
	plot(x=workingdata$Date2, y=workingdata$Sub_metering_1, pch = "", xlab = "", ylab = "Energy sub metering")
		lines(x=workingdata$Date2, y=workingdata$Sub_metering_1)
		lines(x=workingdata$Date2, y=workingdata$Sub_metering_2, col = "red")
		lines(x=workingdata$Date2, y=workingdata$Sub_metering_3, col = "blue")	
		legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "), lty=c(1,1,1))
	
	plot(x=workingdata$Date2, y=workingdata$Global_reactive_power, pch = "", xlab = "datetime", ylab = "Global_reactive_power")
		lines(x=workingdata$Date2, y=workingdata$Global_reactive_power)
	})

##Saving the histogram to a .png file (writes to your active directory:
dev.copy(png, file = "plot4.png")

##CLOSING THE CONNECTION TO THE GRAPHIC DEVICE (do this or you will lose your mind):
dev.off()
