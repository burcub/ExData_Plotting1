#plot4.R
#This function draws 4 graphs, showind Global Active Power, Voltage, Energy Submetering and Global Reactive Power 
#consumption rates.
# It uses Household Power Consumption file to show consumption rates for 2 days on 2007-02-02 and 2007-02-01

plot4<-function(){
  
  #reads all Household Power Consumption file in a data frame called data.
  
  data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  #subsets data data frame into sdata which includes data only for the relevant days
  sdata<-subset(data,Date<="2007-02-03" & Date>="2007-02-01")
  
  #saves the final plots into a png file.
  # creates 4 graphs
  png(file="plot4.png")
  par(mfcol=c(2,2),mar = c(4,4,2,1))
  plot(sdata$Date,sdata$Global_active_power, type="l",main="", xlab="",ylab="Global Active Power (kilowatts)")
  plot(sdata$Date,sdata$Sub_metering_1, type="l",main="", xlab="",ylab="Energy Submetering")
  lines(sdata$Date,sdata$Sub_metering_2,col="red")
  lines(sdata$Date,sdata$Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)
  plot(sdata$Date,sdata$Voltage, type="l",main="", xlab="datetime",ylab="Voltage")
  plot(sdata$Date,sdata$Global_reactive_power, type="l",main="", xlab="datetime",ylab="Global_reactive_power")
  dev.off()
}