vehicle_matches <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehiclesSCC <- SCC[vehicle_matches, SCC]
vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC,]


baltimoreVehicles <- vehiclesNEI[fips=="24510",]

png("plot5.png")

vehicles_plot <- ggplot(baltimoreVehicles,aes(factor(year),Emissions)) +
                        geom_bar(stat="identity", fill = "purple",  width=0.75) +
                        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
                        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
print(vehicles_plot)
dev.off()