# Gather the subset of the NEI data which corresponds to vehicles
vehicle_matches <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehiclesSCC <- SCC[vehicle_matches, SCC]
vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC,]

vehicles_Baltimore_NEI <- vehiclesNEI[fips == "24510",]
vehicles_Baltimore_NEI[, city := c("Baltimore City")]

vehicles_LA_NEI <- vehiclesNEI[fips == "06037",]
vehicles_LA_NEI[, city := c("Los Angeles")]


bothNEI <- rbind(vehicles_Baltimore_NEI,vehicles_LA_NEI)

png("plot6.png")

g <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
            geom_bar(aes(fill=year),stat="identity") +
            facet_grid(.~city) +
            labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
            labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
print(g)
dev.off()