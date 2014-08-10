#plot2.R
#draws Global Active Power consumption plot.


plot2<-function(){
  
  #reads all Household Power Consumption file in a data frame called data.
  data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  sdata<-subset(data,Date<="2007-02-03" & Date>="2007-02-01")
  #saves the plot in plot2 png file
  png(file="plot2.png")
  
  plot(sdata$Date,sdata$Global_active_power, type="l",main="", xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}