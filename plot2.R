#####################################################################################
##                                                                                 ##
##                                                                                 ##
## Exploratory Data Analysis                                                       ##
## Project 1 - Code for plot2.png                                                  ##
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
##PART 1: Plotting the graph with invisible plot points
plot(x=workingdata$Date2, y=workingdata$Global_active_power, pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")

##PART 2: Applying lines
lines(x=workingdata$Date2, y=workingdata$Global_active_power)

##Saving the histogram to a .png file (writes to your active directory):
dev.copy(png, file = "plot2.png")

##CLOSING THE CONNECTION TO THE GRAPHIC DEVICE (do this or you will lose your mind):
dev.off()
