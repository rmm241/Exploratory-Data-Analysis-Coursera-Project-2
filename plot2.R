baltimore_data <- NEI[NEI$fips == "24510", ]
aggregated_baltimore_data <- aggregate(Emissions ~ year, baltimore_data, sum)

png(filename = "plot2.png")
with(aggregated_baltimore_data, 
     barplot(height=Emissions/1000, names.arg = year, col = c("red", "green", "blue", "yellow"), 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Baltimore, Maryland Emissions from 1999 to 2008'))
)
dev.off()