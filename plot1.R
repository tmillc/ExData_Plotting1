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

# Save plot as png
png(filename="plot1.png", width=480, height=480, units ="px")
hist(
  power_consumption_subset$Global_active_power, breaks=12, col="red",
  xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()