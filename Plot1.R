# read the dataset from the source text file which was unzip in a local folder
dataset <- read.table(file = "D:/Disco D/data/EDA/Week1/household_power_consumption.txt", 
sep=";", stringsAsFactors = FALSE, na.strings = '?', skipNul = TRUE, header = TRUE)
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
subdata <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
subdata$Date <- as.Date.character(subdata$Date, format = "%d/%m/%Y")
## Launch the png graphic device
png(filename = "Plot1.png")
## make the plot
hist(subdata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
## close graphic device
dev.off()