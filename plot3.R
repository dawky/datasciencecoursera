setwd("D:/r/coursera")
dat<-read.table("power2.txt",head=TRUE,sep=";", na.strings = "?")
##power2.txt is the txt profile which I've already subsetted the required data

library(readr)

Sys.setlocale("LC_TIME","English")

dat$newtime=readr::parse_datetime(paste(dat[,1],dat[,2],sep=" "), "%d/%m/%Y %H:%M:%S")

png("p3.png",width=480,height=480)
plot(dat$newtime,dat$Sub_metering_1,main="",xlab="",ylab="Energy sub metering",type="l")
lines(dat$newtime,dat$Sub_metering_2,col="red")
lines(dat$newtime,dat$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()