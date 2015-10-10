#####################################################################################
##                                                                                 ##
##                                                                                 ##
## Exploratory Data Analysis                                                       ##
## Project 1 - Code for plot1.png                                                  ##
##                                                                                 ##
## Written by MisterJimmyH                                                         ##
##                                                                                 ##
##                                                                                 ##
#####################################################################################

## Reading the data into R:
data <- read.table(file="C:\\R_WORKING_DIRECTORY\\_Data Science Specialist\\Course 04 Exploratory Data Analysis\\household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

##Subsetting the entire dataset (by the two requested dates) into a working R object:
workingdata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

##Plotting the requested histogram:
hist(as.numeric(workingdata$Global_active_power), main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

##Saving the histogram to a .png file (writes to your active directory:
dev.copy(png, file = "plot1.png")

##CLOSING THE CONNECTION TO THE GRAPHIC DEVICE (do this or you will lose your mind):
dev.off()
