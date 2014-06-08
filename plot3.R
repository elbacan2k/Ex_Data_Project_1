## read file
testset <- read.csv("./data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## create datetime column
testset$datetime <- strptime(paste(testset$Date, testset$Time),format="%d/%m/%Y %H:%M:%S")

## convert date column into date object
## since data has dates in d/m/y we tell it to read it in as such
## the capital Y is for 4 digit years (lower case is for 2 digit years)
testset$Date <- as.Date.character(testset$Date , "%d/%m/%Y")

## find out column classes
##str(testset)

## subset for 2/1/2007 and 2/2/2007
subset1 <- testset[(testset$Date == '2007-02-01' | testset$Date == '2007-02-02'),]

## plot graph and output it
png("plot3.png", width = 480, height = 480)

plot(subset1$datetime, subset1$Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "l", ylim = c(0, 40))

## add lines
lines(subset1$datetime,subset1$Sub_metering_2,col="red")
lines(subset1$datetime,subset1$Sub_metering_3,col="blue")

## add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()
