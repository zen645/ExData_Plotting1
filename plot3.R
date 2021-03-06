# Turn off scientific notation
options(scipen = 999)

# Read in the data
data <- read.csv("household_power_consumption.txt",sep = ";")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data
Feb12 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

Feb12$Sub_metering_1 <- as.numeric(as.character(Feb12$Sub_metering_1))
Feb12$Sub_metering_2 <- as.numeric(as.character(Feb12$Sub_metering_2))
Feb12$Sub_metering_3 <- as.numeric(as.character(Feb12$Sub_metering_3))
Feb12$DateTime <- strptime(paste(Feb12$Date,Feb12$Time), format = "%Y-%m-%d %H:%M:%S")


# Plot data

png("plot3.png", width = 480, height = 480, bg= "transparent")


plot(Feb12$DateTime
      ,Feb12$Sub_metering_1
      , type = "l"
      , ylab = "Energy sub metering"
      , xlab = "")
lines(Feb12$DateTime
      ,Feb12$Sub_metering_2
      ,type = "l"
      ,col = "red")

lines(Feb12$DateTime
      ,Feb12$Sub_metering_3
      ,type = "l"
      ,col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

# Save Plot
dev.off()