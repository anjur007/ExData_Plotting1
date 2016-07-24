#Read Data
household<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

household$dt<-as.Date(household$Date,"%d/%m/%Y")

#Use the following Data
household_subset<-subset(household, dt >= "2007-02-01" & dt <= "2007-02-02")
household_subset$tm <- strptime(paste(household_subset$Date,household_subset$Time),"%d/%m/%Y %H:%M:%S")

#Plot the graph
png(filename="Exploratory_DA_W1/plot3.png",width=480,height=480,units='px')

color_v<-c('black','red','blue')
plot_var<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(household_subset$tm, as.numeric(household_subset$Sub_metering_1),type='l',col=color_v[1],xlab='',ylab='Energy sub metering')
lines(household_subset$tm, as.numeric(household_subset$Sub_metering_2),col=color_v[2])
lines(household_subset$tm, as.numeric(household_subset$Sub_metering_3),col=color_v[3])
legend('topright',legend=plot_var,col=color_v,lty='solid')

x<-dev.off() 