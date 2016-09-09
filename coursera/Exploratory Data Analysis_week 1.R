#set the working dict. and read the data
Sys.setlocale("LC_TIME","English")
setwd("F:/coursera")
dat=read.table("household_power_consumption.txt",sep = ";", na.strings = "?" , stringsAsFactors = F,header = T)

#use strptime to convert the Date and Time variables
dat$Date=strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")
dat$Time=NULL
dat$Date=as.POSIXct(dat$Date)

#find the data with full columns
dat=dat[complete.cases(dat),]

#subset the date wanted
da=subset(dat,Date>="2007-2-1" & Date<"2007-2-3")

#plot 1
hist(da$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

#plot 2
plot(da$Global_active_power~da$Date, main="", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#plot 3
plot(da$Sub_metering_1~da$Date, main="", ylab = "Energy sub metering", xlab = "", col="black",type="l")
points(da$Sub_metering_2~da$Date, col="red",type="l")
points(da$Sub_metering_3~da$Date, col="blue",type="l")
legend("topright", col=c("black", "red", "blue"), lwd=1 , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

#plot 4
par(mfrow=c(2,2))
#1
plot(da$Global_active_power~da$Date, main="", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
#2
plot(da$Voltage~da$Date, main="", xlab = "datetime", ylab = "Voltage", type = "l")
#3
plot(da$Sub_metering_1~da$Date, main="", ylab = "Energy sub metering", xlab = "", col="black",type="l")
points(da$Sub_metering_2~da$Date, col="red",type="l")
points(da$Sub_metering_3~da$Date, col="blue",type="l")
legend("topright", col=c("black", "red", "blue"), lwd=1 , bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.6)
#4
plot(da$Global_reactive_power~da$Date, main="", ylab = "Global_reactive_power", xlab = "datetime", col="black",type="l")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
