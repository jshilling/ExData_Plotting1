###  Read data for specific dates Feb 1 & 2, 2007
df <- read.table("./household_power_consumption.txt", header=F, sep=";", stringsAsFactors=F,
                 skip=66637, nrows=2880)
cnames <- readLines("household_power_consumption.txt", 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(df) <- make.names(cnames[[1]])
df$Date <- strptime(df$Date,"%d/%m/%Y", tz="")


## create hhistogram of global active power
hist(df$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")


## save figure
dev.copy(png, file="plot1.png")
dev.off()