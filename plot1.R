yearly_total_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)

png(filename = "plot1.png")
with(yearly_total_emissions, 
     barplot(height=Emissions/1000, names.arg = year, col = c("red", "green", "blue", "yellow"), 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))
dev.off()