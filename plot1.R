###  Read data for specific dates
setwd("C:/Users/IBM_ADMIN/Dropbox/R Projects/exdata-007_Project1/ExData_Plotting1")
require(lubridate)
df <- read.table("./household_power_consumption.txt", header=F, sep=";", stringsAsFactors=F,
                 skip=66637, nrows=2880)
names(df) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","submetering1","sub_metering2","submetering3")
df$date <- strptime(df$date,"%d/%m/%Y", tz="")

hist(df$global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()