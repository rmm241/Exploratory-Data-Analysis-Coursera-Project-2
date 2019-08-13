coal_SCC <- SCC[grepl("coal", SCC$EI.Sector, ignore.case = TRUE), "SCC"]
coal_NEI <- NEI %>% filter(SCC %in% coal_SCC)
coal_summary <- coal_NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

png(filename = "plot4.png")
c_plot <- ggplot(coal_summary, aes(x=year, y= Emissions/1000, fill=year)) +
                  geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
                  ggtitle("Coal Combustion Emissions, 1999 to 2008")
print(c_plot)
dev.off()