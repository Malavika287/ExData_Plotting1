#-----------------------------------------------------------------------------------------
#Date         : 07-04-2018
#Author       : Mike287
#Description  :
#The purpose of this code is to create a plot of the global active power in kilowatts 
#consumed by households over a period of two days with respect to the day of the week
#-----------------------------------------------------------------------------------------


#Read the data into a data frame skipping to the row pertaining to record for 02-01-2007
df <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)

#Initialise the column names of the data frame
names(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


#Paste the Data and Time columns together to form a new column named DataTime in the dataframe
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime,"%d/%m/%Y %H:%M:%S")

#Plot the graph of Global Active Power with respect to Date and Time using the base plotting system
with(df, plot(DateTime,Global_active_power, ylab = "Global Active Power(kilowatts)", xlab =" ",type = 'l'))

#Export the plot to a png file
dev.copy(png, "plot2.png", width = 480, height = 480)

#Close the plotting device
dev.off()

