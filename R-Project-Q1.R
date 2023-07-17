ny = read.csv('new-york-city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
head(chi)

starting.time = (format(as.POSIXct(chi$Start.Time), format = "%H"))

ggplot(aes(x = as.numeric(format(as.POSIXct(Start.Time), format = "%H"))), data = chi) + geom_histogram(binwidth=0.5) + scale_x_continuous(breaks = 0:23) + scale_y_continuous(breaks = seq(0, 40000, 5000)) + fill = I('lightblue') + ggtitle('Bike-Share Rides Initiated Per Hour in the City of Chicago') + labs(x = 'Hour of Day', y = 'Number of Rides Initiated') + facet_wrap(~as.numeric(format(as.POSIXct(chi$Start.Time), format = "%Y")))
hour.count = table(starting.time)
rides.initiated = array(data = hour.count)
hour.of.day = 0:23
table1 = cbind(hour.of.day, rides.initiated)
print(table1)
summary(rides.initiated)
print(hour.of.day[which.max(rides.initiated)])
print(hour.of.day[which.min(rides.initiated)])
