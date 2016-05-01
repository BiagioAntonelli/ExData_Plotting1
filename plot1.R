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

##Plotting
#Plot 1
subset$Global_active_power<-as.numeric(subset$Global_active_power)
hist(subset$Global_active_power , col = "red", main = paste("Global_active_power"),
     xlab = paste("Global_active_power") )

#Export png file
dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off()


