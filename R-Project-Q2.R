ny = read.csv('new-york-city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

ny <- replace(ny, ny=='', NA)
ggplot(aes(x = User.Type, y = (Trip.Duration/60), fill = User.Type), data = subset(ny, !is.na(User.Type))) + geom_boxplot() + scale_y_continuous(breaks = seq(0, 60, 10)) + coord_cartesian(ylim = c(0, 60)) + xlab('User Type') + ylab('Trip Duration (Minutes)') + ggtitle('Comparing Trip Duration in New York City Bike Shares by User Type')
by(ny$Trip.Duration/60, ny$User.Type, summary)
