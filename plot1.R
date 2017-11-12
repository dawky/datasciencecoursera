setwd("D:/r/coursera")
dat<-read.table("power2.txt",head=TRUE,sep=";", na.strings = "?")
##power2.txt is the txt profile which I've already subsetted the required data
  
library(readr)

Sys.setlocale("LC_TIME","English")

dat$newtime=readr::parse_datetime(paste(dat[,1],dat[,2],sep=" "), "%d/%m/%Y %H:%M:%S")

png("p1.png",width=480,height=480)
hist(dat$Global_active_power,col="red",main="Global active power",xlab="Global active power(kilowatts)")
dev.off()