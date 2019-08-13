baltimore_data <- NEI[NEI$fips == "24510", ]
aggregated_baltimore_data_year_type <- aggregate(Emissions ~ year + type, baltimore_data, sum)

png(filename = "plot3.png", width= 640, height=480)

g <- ggplot(aggregated_baltimore_data_year_type, aes(x = year, y = Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()