#First ensure .txt file is in wd, then read in the text file data
hpc <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

hpc <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
hpc <- unz(exdata_data_household_power_consumption, filename="household_power_consumption.txt", open = "r")

#First, read in the text file data
hpc <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Filtering for dates of 2007-02-01 and 2007-02-02.
library(dplyr)
hpc <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Generates a histogram of Global Active Power
plot1 <- hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
plot1