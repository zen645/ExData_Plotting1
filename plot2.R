# Turn off scientific notation
options(scipen = 999)

# Read in the data
data <- read.csv("household_power_consumption.txt",sep = ";")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data
Feb12 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

Feb12$Global_active_power <- as.numeric(as.character(Feb12$Global_active_power))
Feb12$DateTime <- strptime(paste(Feb12$Date,Feb12$Time), format = "%Y-%m-%d %H:%M:%S")


# Plot data
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

with(Feb12, plot(DateTime
                ,Global_active_power
                , type = "l"
                , ylab = "Global Active Power (kilowatts)"
                , xlab = ""))

# Save Plot
dev.off()