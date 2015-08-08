household_power_consumption <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",na.strings="?")
library(lubridate)

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")


quiz1q2<-household_power_consumption[household_power_consumption$Date>="2007-02-01" & household_power_consumption$Date<="2007-02-02",]

rm(household_power_consumption)


quiz1q2$weekday <-weekdays(quiz1q2$Date)

quiz1q2$Datetime<-as.POSIXct(paste(quiz1q2$Date, quiz1q2$Time), format="%Y-%m-%d %H:%M:%S")
png("Plot2.png", width = 480, height = 480)
plot(quiz1q2$Datetime,quiz1q2$Global_active_power,type = "l" ,main = "",ylab = "Global Active power (Kilowats)",xlab="")
dev.off()

