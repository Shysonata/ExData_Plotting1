#First ensure .txt file is in wd, then read in the text file data
hpc <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Filtering for dates of 2007-02-01 and 2007-02-02.
library(dplyr)
hpc <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Tidy up dates/times
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- mutate(hpc, date_time = paste(hpc$Date, hpc$Time))
hpc$date_time <- as.POSIXct(hpc$date_time)

#Setting up matrix of plots
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#Plotting the plots by row
#plot2
with(hpc, plot(hpc$Global_active_power~hpc$date_time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
plot2
#New voltage plot
with(hpc, plot(Voltage~date_time, type="l", ylab="Voltage (volt)", xlab=""))
#plot3
with(hpc, plot(Sub_metering_1~date_time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
lines(hpc$Sub_metering_2~hpc$date_time, type="l", col = "red")
lines(hpc$Sub_metering_3~hpc$date_time, type="l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#New global reactive power plot
with(hpc, plot(Global_reactive_power~date_time, type="l", ylab="Global Rective Power (kilowatts)",xlab=""))