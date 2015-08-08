
household_power_consumption <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",na.strings="?")
#library(lubridate)

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")


quiz1q1<-household_power_consumption[household_power_consumption$Date>="2007-02-01" & household_power_consumption$Date<="2007-02-02",]

rm(household_power_consumption)

quiz1q1$Global_active_power<-as.numeric(quiz1q1$Global_active_power)

png("Plot1.png", width = 480, height = 480)
hist(quiz1q1$Global_active_power, freq=TRUE, col="Red",main = "Global Active Power ",xlab = "Global Active power (Kilowats)")
dev.off()

#hist(subset(quiz1q1,quiz1q1$Global_active_power<=2)$Global_active_power)