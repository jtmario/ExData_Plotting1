 #check required datasets on current working directory
if (!file.exists("household_power_consumption.txt") ) { 
  stop("The dataset not found.")
}else{	
	#loading all data
	data <- read.csv2("household_power_consumption.txt",as.is=TRUE)
	 
	#Converting $Date as date format
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	
	#Getting only February 1th and 2th, 2007
	data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

	#Converting Global active power to numeric
	data$Global_active_power <- as.numeric(data$Global_active_power)

	#Creating plot and save to png
	par(bg="white") # set a background to white
	png(file = "plot1.png",width = 480, height = 480, units = "px")
	hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
}
