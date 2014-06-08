## read file
testset <- read.csv("./data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## convert date column into date object
## since data has dates in d/m/y we tell it to read it in as such
## the capital Y is for 4 digit years (lower case is for 2 digit years)
testset$Date <- as.Date.character(testset$Date , "%d/%m/%Y")

## find out column classes
##str(testset)

## subset for 2/1/2007 and 2/2/2007
subset1 <- testset[(testset$Date == '2007-02-01' | testset$Date == '2007-02-02'),]

## 
## build histogram and output it
png("plot1.png", width = 480, height = 480)
hist(subset1$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
