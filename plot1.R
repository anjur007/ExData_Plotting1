#Read Data
household<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

household$dt<-as.Date(household$Date,"%d/%m/%Y")

#Use the following Data
household_subset<-subset(household, dt >= "2007-02-01" & dt <= "2007-02-02")
household_subset$tm <- strptime(paste(household_subset$Date,household_subset$Time),"%d/%m/%Y %H:%M:%S")

#Plot the graph
png(filename="Exploratory_DA_W1/plot1.png",width=480,height=480,units='px')
hist(as.numeric(household_subset$Global_active_power),main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
x<-dev.off() 