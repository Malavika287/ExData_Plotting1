#-----------------------------------------------------------------------------------------
#Date         : 05-04-2018
#Author       : Mike287
#Description  :
#The purpose of this code is to create a histogram of the global active power in kilowatts 
#consumed by households over a period of two days i.e on 02-01-2007 and 02-02-2007
#-----------------------------------------------------------------------------------------


#Read the data into a data frame skipping to the row pertaining to record for 02-01-2007
df <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)

#Initialise the column names of the data frame
names(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Plot a histogram of Global Active Power using the base plotting system
hist(df$Global_active_power,col="orangered2", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

#Export the plot to a png file
dev.copy(png, "plot1.png", width = 480, height = 480)

#Close the plotting device
dev.off()
