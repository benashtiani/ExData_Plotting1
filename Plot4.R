## Read data from the .txt file

mydf <- read.table("household_power_consumption.txt",
                   na.strings = "?", header = TRUE, sep = ";")

mydf$Date

## Plot 4

df_plot2 <- mydf[mydf$Date %in% c("1/2/2007", "2/2/2007"),]

df_plot2$Date <- as.Date(df_plot2$Date, "%d/%m/%Y")

df_plot2$datetime <- paste(df_plot2$Date, df_plot2$Time)

df_plot2$datetime <- strptime(df_plot2$datetime, "%Y-%m-%d %H:%M:%S")

df_plot2$datetime <- as.POSIXct(df_plot2$datetime, "%Y-%m-%d %H:%M:%S", tz = "EDT")

png("Plot4.png")

par(mfrow = c(2,2))

# First sub plot
plot(df_plot2$datetime, df_plot2$Global_active_power, type = 'l',
     xlim=c(as.POSIXct('2007-02-01 00:00:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT"),
            as.POSIXct('2007-02-02 23:59:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT")), 
     ylab = "Global Active Power (kilowatts)", xlab = '')

# Second sub plot
plot(df_plot2$datetime, df_plot2$Voltage, type = 'l',
     xlim=c(as.POSIXct('2007-02-01 00:00:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT"),
            as.POSIXct('2007-02-02 23:59:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT")), 
     ylab = "Voltage", xlab = '')


# Third sub plot
plot(df_plot2$datetime, df_plot2$Sub_metering_1, type = 'l',
     xlim=c(as.POSIXct('2007-02-01 00:00:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT"),
            as.POSIXct('2007-02-02 23:59:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT")), ylab = "Energy sub metering", xlab = '')

lines(df_plot2$datetime, df_plot2$Sub_metering_2, type = 'l', col = "red")
lines(df_plot2$datetime, df_plot2$Sub_metering_3, type = 'l', col = "blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex = 0.8)

# Fourth sub plot
plot(df_plot2$datetime, df_plot2$Global_reactive_power, type = 'l',
     xlim=c(as.POSIXct('2007-02-01 00:00:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT"),
            as.POSIXct('2007-02-02 23:59:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT")), 
     ylab = "Global_reactive_power", xlab = '')

dev.off()
