#Read Data
household<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

household$dt<-as.Date(household$Date,"%d/%m/%Y")

#Use the following Data
household_subset<-subset(household, dt >= "2007-02-01" & dt <= "2007-02-02")
household_subset$tm <- strptime(paste(household_subset$Date,household_subset$Time),"%d/%m/%Y %H:%M:%S")

#Plot the graph
png(filename="Exploratory_DA_W1/plot4.png",width=480,height=480,units='px')

par(mfrow=c(2,2))

plot(household_subset$tm,household_subset$Global_active_power,ylab='Global Active Power',xlab='',type='l')

plot(household_subset$tm,household_subset$Voltage,xlab='tm',ylab='Voltage',type='l')

plot(household_subset$tm,household_subset$Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(household_subset$tm,household_subset$Sub_metering_2,col='red')
lines(household_subset$tm,household_subset$Sub_metering_3,col='blue')

plot(household_subset$tm,household_subset$Global_reactive_power,xlab='tm',ylab='Global_reactive_power',type='l')

x<-dev.off() 