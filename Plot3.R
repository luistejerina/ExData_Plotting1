household_power_consumption <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",na.strings="?")
library(ggplot2)

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")


quiz1q3<-household_power_consumption[household_power_consumption$Date>="2007-02-01" & household_power_consumption$Date<="2007-02-02",]

rm(household_power_consumption)


quiz1q3$weekday <-weekdays(quiz1q3$Date)

quiz1q3$Datetime<-as.POSIXct(paste(quiz1q3$Date, quiz1q3$Time), format="%Y-%m-%d %H:%M:%S")
png("Plot3.png", width = 480, height = 480)
plot(quiz1q3$Datetime,quiz1q3$ Sub_metering_3,type = "l" ,ylim=c(0,40),main = "",col="blue",ylab = "Energy sub metering",xlab="")
par(new=T)
plot(quiz1q3$Datetime,quiz1q3$ Sub_metering_1,type = "l" ,ylim=c(0,40),main = "",col="black",ylab = "",xlab="")
par(new=T)
plot(quiz1q3$Datetime,quiz1q3$ Sub_metering_2,type = "l" ,ylim=c(0,40),main = "",col="red",ylab = "",xlab="")
legend("topright", legend = c("Sub metering 1", "Sub metering 2","Sub_metering 3"), bty = "n",lwd=2,col=c("black","red","blue"))
#plot(6:25,rnorm(20),type="b",xlim=c(1,30),ylim=c(-2.5,2.5),col=2)


#ggplot(quiz1q3, aes(Datetime)) + geom_line(aes(y = Sub_metering_3, colour = "red")) +   geom_line(aes(y = Sub_metering_2, colour = "blue"))

dev.off()