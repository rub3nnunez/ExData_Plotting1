###Plot2.R

## Get values

        consumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
        plotsource <- subset(consumption, Date %in% c("1/2/2007","2/2/2007"))

        plotsource$Date <- as.Date(plotsource$Date, format="%d/%m/%Y")
        fulltime <- paste(as.Date(plotsource$Date), plotsource$Time)
        plotsource$fulltime <- as.POSIXct(fulltime)

##Line Plot

        with(plotsource, plot(Global_active_power~fulltime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

##PNG generation
        
        dev.copy(png, file="plot2.png", height=480, width=480)
        dev.off()