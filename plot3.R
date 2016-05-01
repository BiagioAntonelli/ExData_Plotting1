# Setting wd
dir<-setwd("~/Desktop/exploratory data analysis")

# reading the data
dataset<-read.csv2("household_power_consumption.txt" ,  stringsAsFactors = FALSE)
x<-as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
library(dplyr)
dataset<-mutate(dataset,x)
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")


#Subsetting  from 2007-02-01 to 2007-02-02
limits<-which(dataset$Date=="2007-02-01" |dataset$Date=="2007-02-02") 
subset<-dataset[min(limits):max(limits),]

#plot 3
with(subset, plot(x, Sub_metering_1 ,type="l", ylab="Energy sub metering"))
with(subset, points(x, Sub_metering_2 ,type="l", col="red"))
with(subset, points(x, Sub_metering_3 ,type="l", col="blue"))
legend("topright", pch = 1, col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off()

