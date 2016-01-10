# read the dataset from the source text file which was unzip in a local folder
dataset <- read.table(file = "D:/Disco D/data/EDA/Week1/household_power_consumption.txt", 
                      sep=";", stringsAsFactors = FALSE, na.strings = '?', skipNul = TRUE, header = TRUE)
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
subdata <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
subdata$Date <- as.Date.character(subdata$Date, format = "%d/%m/%Y")
Sys.setlocale(category = "LC_TIME", locale="en_US.UTF-8")
datetime <- strptime(paste(as.character(subdata$Date),subdata$Time), format = "%Y-%m-%d %H:%M:%S")
## Launch the png graphic device
png(filename = "Plot4.png")
## define 2 rows and 2 columns
par(mfrow = c(2,2))
## make the plots 
plot(datetime, subdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(datetime, subdata$Voltage , type = "l", xlab = "datetime", ylab = "Voltage")
with(subdata, plot(datetime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(subdata, points(datetime, Sub_metering_1, type = "l", main = "Sub_metering_1"))
with(subdata, points(datetime, Sub_metering_2, type = "l", col="red", main = "Sub_metering_2"))
with(subdata, points(datetime, Sub_metering_3, type = "l", col="blue", main = "Sub_metering_3"))
legend("topright", lwd = 2, lty=1, bty="n", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, subdata$Global_reactive_power , type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
## close graphic device
dev.off()