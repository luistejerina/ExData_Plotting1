household_power_consumption <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",na.strings="?")
library(ggplot2)

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")


quiz1q4<-household_power_consumption[household_power_consumption$Date>="2007-02-01" & household_power_consumption$Date<="2007-02-02",]

rm(household_power_consumption)


quiz1q4$weekday <-weekdays(quiz1q4$Date)

quiz1q4$Datetime<-as.POSIXct(paste(quiz1q4$Date, quiz1q4$Time), format="%Y-%m-%d %H:%M:%S")
png("Plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
plot(quiz1q4$Datetime,quiz1q4$Global_active_power,type = "l" ,main = "",ylab = "Global Active power (Kilowats)",xlab="")

plot(quiz1q4$Datetime,quiz1q4$Voltage,type = "l" ,main = "",ylab = "Voltage",xlab="datetime")


plot(quiz1q4$Datetime,quiz1q4$Sub_metering_3,type = "l" ,ylim=c(0,40),main = "",col="blue",ylab = "Energy sub metering",xlab="")
lines(quiz1q4$Datetime,quiz1q4$ Sub_metering_1,type = "l" ,ylim=c(0,40),main = "",col="black",ylab = "",xlab="")
lines(quiz1q4$Datetime,quiz1q4$ Sub_metering_2,type = "l" ,ylim=c(0,40),main = "",col="red",ylab = "",xlab="")

legend("topright", legend = c("Sub metering 1", "Sub metering 2","Sub_metering 3"), bty = "n",lwd=2,col=c("black","red","blue"))

plot(quiz1q4$Datetime,quiz1q4$Global_reactive_power,type = "l" ,main = "",xlab="datetime",ylab="Global reactive power")

dev.off()
