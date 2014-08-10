#plot3.R
#draws energy submetering line plot for submetering1,submetering2and submetering3
plot3<-function(){
  #reads all Household Power Consumption file in a data frame called data.
  data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  sdata<-subset(data,Date<="2007-02-03" & Date>="2007-02-01")
  
  #saves the plot in plot3 png file
  png(file="plot3.png")
  
  plot(sdata$Date,sdata$Sub_metering_1, type="l",main="", xlab="",ylab="Energy Submetering")
  lines(sdata$Date,sdata$Sub_metering_2,col="red")
  lines(sdata$Date,sdata$Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)
  dev.off()
}