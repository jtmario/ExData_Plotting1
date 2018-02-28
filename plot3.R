 #check required datasets on current working directory
if (!file.exists("household_power_consumption.txt") ) { 
  stop("The dataset not found.")
}else{	
	#Setting the locale to show english weeks days
	Sys.setlocale("LC_TIME", "English")

	#loading all data
	data <- read.csv2("household_power_consumption.txt",as.is=TRUE)
	 
	#Converting $Date as date format
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	
	#Getting only February 1th and 2th, 2007
	data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
	
	#Converting variables to numeric
	data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
	data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
	data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

	#Creating a full date time column
	data$DateTime <- paste(data$Date,data$Time)
	data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
	

	#Creating plot and save to png
	par(bg="white") # set a background to white
	png(file = "plot3.png",width = 480, height = 480, units = "px")
	plot(data$DateTime,data$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
	lines(data$DateTime,data$Sub_metering_2, type="l",col="red")
	lines(data$DateTime,data$Sub_metering_3, type="l", col="blue")
	legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))	
	dev.off()
}
