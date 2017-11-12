setwd("D:/r/coursera")
dat<-read.table("power2.txt",head=TRUE,sep=";", na.strings = "?")
##power2.txt is the txt profile which I've already subsetted the required data

library(readr)

Sys.setlocale("LC_TIME","English")

dat$newtime=readr::parse_datetime(paste(dat[,1],dat[,2],sep=" "), "%d/%m/%Y %H:%M:%S")

png("p4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,4,4))
with(dat,{plot(dat$newtime,dat$Global_active_power,main="",xlab="",ylab="Global active power(kilowatts)",type="l")
          
          plot(dat$newtime,dat$Voltage,main="",xlab="datetime",ylab="Voltage",type="l")
          
          plot(dat$newtime,dat$Sub_metering_1,main="",xlab="",ylab="Energy sub metering",type="l")
          lines(dat$newtime,dat$Sub_metering_2,col="red")
          lines(dat$newtime,dat$Sub_metering_3,col="blue")
          legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)
          
          
          plot(dat$newtime,dat$Global_reactive_power,main="",xlab="datetime",ylab="Global_reactive_power",type="l")
})
dev.off()