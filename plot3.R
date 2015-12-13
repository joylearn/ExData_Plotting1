setwd("~/JH/C4 - Exploratory Data/project")
hpc <- read.table("household_power_consumption.txt", sep =";",  header = TRUE, na.strings = "?") # returns data.frame

# the date format in the .txt file is dd-mm-yyyy,
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#select observations where date is equals to  1st or 2nd Feb 2007
hpc <- hpc[(hpc$Date=="2007/02/01") | (hpc$Date=="2007/02/02"),]

#merge date & time column, making it "POSIXlt"
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

# plot to screen
plot(hpc$DateTime,hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(hpc$DateTime,hpc$Sub_metering_2, type = "l", col="red")
points(hpc$DateTime,hpc$Sub_metering_3,  type = "l", col="blue")
legend("topright", lty =1, lwd = 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# copy from plot on screen to png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

a <- dir()
print(a[grep("png", a)])

