setwd("~/JH/C4 - Exploratory Data/project")
hpc <- read.table("household_power_consumption.txt", sep =";",  header = TRUE) # returns data.frame

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))


#plotting to file directly
png(filename = "plot1.png", width = 480, height = 480)
with(hpc, hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power" ))
dev.off()


#plotting to screen directly
#hist(hpc$Global_active_power, col = "pink", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")

#copy plot on screen  to PNG file
#dev.copy(png, file="plot1a.png", width=480, height=480)
#dev.off()

a <- dir()
print(a[grep("png", a)])

