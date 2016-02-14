#Import data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

#Condition data
data <- household_power_consumption
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

#Subset data
d <- data[data$datetime >= "2007-02-01" & data$datetime <= "2007-02-03",]

#Condition data
d$Global_active_power <- as.numeric(as.character.factor(d$Global_active_power))
d$Global_reactive_power <- as.numeric(as.character.factor(d$Global_reactive_power))
d$Voltage <- as.numeric(as.character.factor(d$Voltage))
d$Sub_metering_1 <- as.numeric(as.character.factor(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character.factor(d$Sub_metering_2))

#Plot graph
png(filename = "plot1.png")
hist(d$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
