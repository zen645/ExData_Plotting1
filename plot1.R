# Turn off scientific notation
options(scipen = 999)

# Read in the data
data <- read.csv("household_power_consumption.txt",sep = ";")

data2 <- data

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

Feb12 <- subset(data2, Date == "2007-02-01" | Date == "2007-02-02")


png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

hist(Feb12$Global_active_power
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , col = "red")



dev.off()