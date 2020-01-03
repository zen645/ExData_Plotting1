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
Feb12$Global_active_power <- as.numeric(as.character(Feb12$Global_active_power))
Feb12$Global_reactive_power <- as.numeric(as.character(Feb12$Global_reactive_power))
Feb12$Voltage <- as.numeric(as.character(Feb12$Voltage))
Feb12$DateTime <- strptime(paste(Feb12$Date,Feb12$Time), format = "%Y-%m-%d %H:%M:%S")


# Plot data
# Create 2x2 grid
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

par(mfrow = c(2,2))



# Plot Golbal Active Power
with(Feb12, plot(DateTime
                 ,Global_active_power
                 , type = "l"
                 , ylab = "Global Active Power"
                 , xlab = ""))

# Plot Voltage
with(Feb12, plot(DateTime
                 ,Voltage
                 , type = "l"
                 , ylab = "Voltage"
                 , xlab = "datetime"))

# Plot sub-metering
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

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(1,1), col = c("black","red","blue"))


# Plot Golbal Reactive Power
with(Feb12, plot(DateTime
                 ,Global_reactive_power
                 , type = "l"
                 , ylab = "Global reactive Power"
                 , xlab = "datetime"))


dev.off()