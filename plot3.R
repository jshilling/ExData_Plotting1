###  Read data for specific dates Feb 1 & 2, 2007
df <- read.table("./household_power_consumption.txt", header=F, sep=";", stringsAsFactors=F,
                 skip=66637, nrows=2880)
cnames <- readLines("household_power_consumption.txt", 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(df) <- make.names(cnames[[1]])
df$Date <- strptime(df$Date,"%d/%m/%Y", tz="")
df$datetime <- as.POSIXct(paste(df$Date, df$Time))

## create chart frame

with(df, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering"))

## draw subsets

with(df, lines(datetime, Sub_metering_1, col = "black"))
with(df, lines(datetime, Sub_metering_2, col = "red"))
with(df, lines(datetime, Sub_metering_3, col = "blue"))

## add legend
l <- c("Sub_metereing_1","Sub_metereing_2","Sub_metereing_3")
legend("topright",  col = c("black","red","blue"), legend = l, lty=1)


## save figure
dev.copy(png, file="plot3.png")
dev.off()

