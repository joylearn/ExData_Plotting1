setwd("~/JH/C4 - Exploratory Data/project")
hpc <- read.table("household_power_consumption.txt", sep =";",  header = TRUE, na.strings = "?") # returns data.frame

# the date format in the .txt file is dd-mm-yyyy,
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#select observations where date is equals to  1st or 2nd Feb 2007
hpc <- hpc[(hpc$Date=="2007/02/01") | (hpc$Date=="2007/02/02"),]

#merge date & time column, making it "POSIXlt"
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

#with(hpc, plot(DateTime, Global_active_power, type = "l"))
#plot(x=hpc$DateTime, y=hpc$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

a <- dir()
print(a[grep("png", a)])
