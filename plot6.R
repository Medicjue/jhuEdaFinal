## plot6.R ##
source("loadData.R")

source("readData.R")

motorSCC <- SCC[grepl('Motor', SCC$Short.Name, fixed=T), ]
motorEMI <- merge(x=EMI, y=motorSCC, by="SCC")
motorBalAndLAEMI <- subset(motorEMI, motorEMI$fips=="24510" | motorEMI$fips=="06037")
motorLAEMI <-  subset(motorEMI, motorEMI$fips=="06037")

aggMotorBalAndLAEMI <- aggregate(Emissions ~ year+fips, motorBalAndLAEMI, FUN = sum)

ggplot(data=motorBalAndLAEMI, aes(x=year, y=Emissions, group=fips, color=fips)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") + ggtitle("Motorcycle Related PM2.5 Emissions in Baltimore & Los Angeles (1999 - 2008)")

dev.copy(png, filename="plot6.png", width=480, height=480)
dev.off ()