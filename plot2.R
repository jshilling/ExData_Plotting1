###  Read data for specific dates Feb 1 & 2, 2007
df <- read.table("./household_power_consumption.txt", header=F, sep=";", stringsAsFactors=F,
                 skip=66637, nrows=2880)
cnames <- readLines("household_power_consumption.txt", 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(df) <- make.names(cnames[[1]])
df$Date <- strptime(df$Date,"%d/%m/%Y", tz="")
df$datetime <- as.POSIXct(paste(df$Date, df$Time))

## create time series of global acive power
with(df, plot(datetime, Global_active_power, type="l", 
              xlab = "", ylab="Global Active Power (kilowatts)"))


## save figure
dev.copy(png, file="plot2.png")
dev.off()