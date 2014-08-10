#plot1.R
#draws histogram of Global Active Power consumption for days 2007-02-02 and 2007-02-01

plot1<-function(){
  
  #reads all Household Power Consumption file in a data frame called data.
  
  data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  sdata<-subset(data,Date<="2007-02-03" & Date>="2007-02-01")
  
  png(file="plot1.png")
   
  hist(sdata$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}