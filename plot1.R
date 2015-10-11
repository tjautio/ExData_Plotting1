library(dplyr)
setwd("C:\\Users\\Timo\\Documents\\GitHub\\datasciencecoursera\\electricity")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- mutate(data, Date = as.Date(data$Date, format = "%d/%m/%Y"))
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data <- mutate(data, Global_active_power = as.numeric(data$Global_active_power)/500,
               Sub_metering_1 = as.numeric(data$Sub_metering_1),
               Sub_metering_2 = as.numeric(data$Sub_metering_2),
               Sub_metering_3 = as.numeric(data$Sub_metering_3))

png("plot1.png")
pic <- hist(data$Global_active_power,
            col ="red",
            xlab = "Global Active Power (kilowatts)",
            main = "Global Active Power",
            ylim = c(0,1200),
            xlim = c(0,6))

dev.off()
rm(pic,data)



