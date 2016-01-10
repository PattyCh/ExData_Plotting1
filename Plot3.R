# read the dataset from the source text file which was unzip in a local folder
dataset <- read.table(file = "D:/Disco D/data/EDA/Week1/household_power_consumption.txt", 
                      sep=";", stringsAsFactors = FALSE, na.strings = '?', skipNul = TRUE, header = TRUE)
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
subdata <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
subdata$Date <- as.Date.character(subdata$Date, format = "%d/%m/%Y")
Sys.setlocale("LC_TIME", "English")
datetime <- strptime(paste(as.character(subdata$Date),subdata$Time), format = "%Y-%m-%d %H:%M:%S")
## Launch the png graphic device
png(filename = "Plot3.png")
## make the multiple plot
with(subdata, plot(datetime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(subdata, points(datetime, Sub_metering_1, type = "l", main = "Sub_metering_1"))
with(subdata, points(datetime, Sub_metering_2, type = "l", col="red", main = "Sub_metering_2"))
with(subdata, points(datetime, Sub_metering_3, type = "l", col="blue", main = "Sub_metering_3"))
## make annotations
legend("topright", lwd = 2, lty=1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## close graphic device
dev.off()