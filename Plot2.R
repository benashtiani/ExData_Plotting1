## Read data from the .txt file

mydf <- read.table("household_power_consumption.txt",
                   na.strings = "?", header = TRUE, sep = ";")

mydf$Date

## Plot 2

df_plot2 <- mydf[mydf$Date %in% c("1/2/2007", "2/2/2007"),]

df_plot2$Date <- as.Date(df_plot2$Date, "%d/%m/%Y")

df_plot2$datetime <- paste(df_plot2$Date, df_plot2$Time)

df_plot2$datetime <- strptime(df_plot2$datetime, "%Y-%m-%d %H:%M:%S")

df_plot2$datetime <- as.POSIXct(df_plot2$datetime, "%Y-%m-%d %H:%M:%S", tz = "EDT")

png("Plot2.png")

plot(df_plot2$datetime, df_plot2$Global_active_power, type = 'l',
     xlim=c(as.POSIXct('2007-02-01 00:00:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT"),
        as.POSIXct('2007-02-02 23:59:00', format="%Y-%m-%d %H:%M:%S", tz = "EDT")), ylab = "Global Active Power (kilowatts)", xlab = '')

dev.off()
