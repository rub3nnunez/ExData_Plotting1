###Plot3.R

## Get values

        consumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
        plotsource <- subset(consumption, Date %in% c("1/2/2007","2/2/2007"))

        plotsource$Date <- as.Date(plotsource$Date, format="%d/%m/%Y")
        fulltime <- paste(as.Date(plotsource$Date), plotsource$Time)
        plotsource$fulltime <- as.POSIXct(fulltime)
        
        
##Lines plot

        with(plotsource, plot(Sub_metering_1~fulltime, type="l", xlab= "", ylab="Energy Sub Metering"))
        
        lines(plotsource$Sub_metering_2~plotsource$fulltime, col = 'Red')
        lines(plotsource$Sub_metering_3~plotsource$fulltime, col = 'Blue')
        
        legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##PNG generation

        dev.copy(png, file="plot3.png", height=480, width=480)
        dev.off()