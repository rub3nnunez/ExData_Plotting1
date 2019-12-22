###Plot4.R

## Get values

        consumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
        plotsource <- subset(consumption, Date %in% c("1/2/2007","2/2/2007"))

        plotsource$Date <- as.Date(plotsource$Date, format="%d/%m/%Y")
        fulltime <- paste(as.Date(plotsource$Date), plotsource$Time)
        plotsource$fulltime <- as.POSIXct(fulltime)
        
##Multi plot

        ##Prepare canvas
        
        par(mfrow=c(2,2))
        
        ##Plot
        
        plot(plotsource$Global_active_power~plotsource$fulltime, type="l", ylab="Global Active power", xlab="")
        
        plot(plotsource$Voltage ~ plotsource$fulltime, type="l", ylab="Voltage", xlab="Datetime")
        
        with(plotsource, plot(Sub_metering_1~fulltime, type="l", ylab="Energy sub metering", xlab=""))
        lines(plotsource$Sub_metering_2~plotsource$fulltime, col = 'Red')
        lines(plotsource$Sub_metering_3~plotsource$fulltime, col = 'Blue')

        plot(plotsource$Global_reactive_power~plotsource$fulltime, type="l", ylab="Global_reactive_power", xlab="Datetime")
        
##PNG generation

        dev.copy(png, file="plot4.png", height=480, width=480)
        dev.off()