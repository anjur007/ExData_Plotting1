#Read Data
household<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

household$dt<-as.Date(household$Date,"%d/%m/%Y")

#Use the following Data
household_subset<-subset(household, dt >= "2007-02-01" & dt <= "2007-02-02")
household_subset$tm <- strptime(paste(household_subset$Date,household_subset$Time),"%d/%m/%Y %H:%M:%S")

#Plot the graph
png(filename="Exploratory_DA_W1/plot2.png",width=480,height=480,units='px')
plot(household_subset$tm,as.numeric(household_subset$Global_active_power),ylab='Global Active Power (kilowatts)', xlab='', type='l')
x<-dev.off() 