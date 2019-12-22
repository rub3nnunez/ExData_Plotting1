###Plot1.R

## Get values

        consumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
        plotsource <- subset(consumption, Date %in% c("1/2/2007","2/2/2007"))

##Histogram plot

        hist(plotsource$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",
                main="Global Active Power")

##PNG generation
        
        dev.copy(png, file="plot1.png", height=480, width=480)
        dev.off()
        