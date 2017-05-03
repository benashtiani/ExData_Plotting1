## Read data from the .txt file

mydf <- read.table("household_power_consumption.txt",
                   na.strings = "?", header = TRUE, sep = ";")

## Plot 1
png("Plot1.png")
global_hist <- hist(mydf$Global_active_power,
      plot = FALSE)

global_hist$counts = global_hist$counts/1000

plot(global_hist, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", ylim = c(0, 1000))

dev.off()
# Need to fix the Y-axis limits
