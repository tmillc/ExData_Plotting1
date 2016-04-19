# Set your working directory
setwd("~/code/R/coursera/exploratory/hw1/ExData_Plotting1")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("data")) dir.create("data")
if (!file.exists("data/power.zip")) {
  filepath <- "./data/power.zip"
  download.file(fileurl, filepath, method = "curl")
  dateDownloaded <- date()
  unzip(filepath, exdir = "./data")
}
text <- "./data/household_power_consumption.txt"
# This might take awhile
power_consumption <- read.table(text, sep=";", na.strings = "?", header = TRUE)
# We're only interested in data from the dates 2007-02-01 and 2007-02-02
power_consumption_subset <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# create a date/time variable
date_time <- paste(power_consumption_subset$Date, power_consumption_subset$Time)
power_consumption_subset$DateTime <- strptime(date_time, "%d/%m/%Y %T") # %T == %H:%M:%S

# Making the plot
png(filename="plot3.png", width=480, height=480, units ="px")
plot(power_consumption_subset$DateTime, power_consumption_subset$Sub_metering_1,
  type="n", xlab="", ylab="Energy sub metering" )

lines(power_consumption_subset$DateTime, power_consumption_subset$Sub_metering_1,
  col="black")
lines(power_consumption_subset$DateTime, power_consumption_subset$Sub_metering_2,
  col="red")
lines(power_consumption_subset$DateTime, power_consumption_subset$Sub_metering_3,
  col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=c(1,1,1), lwd=c(2,2,2), col=c("black", "red", "blue")
)
dev.off()