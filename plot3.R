library(dplyr)
setwd("C:\\Users\\Timo\\Documents\\GitHub\\datasciencecoursera\\electricity")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- mutate(data, Date = as.Date(data$Date, format = "%d/%m/%Y"))
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data <- mutate(data, Global_active_power = as.numeric(data$Global_active_power)/500,
               Sub_metering_1 = as.numeric(data$Sub_metering_1),
               Sub_metering_2 = as.numeric(data$Sub_metering_2),
               Sub_metering_3 = as.numeric(data$Sub_metering_3))
data <- mutate(data, weekday = weekdays(data$Date))

png("plot3.png")
plot(data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", axes = FALSE)
points(data$Sub_metering_2, col = "red", type = "l")
points(data$Sub_metering_3, col = "blue", type = "l")
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), lty= "solid", col = c("black", "red", "blue"))
dev.off()