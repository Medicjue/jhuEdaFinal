## plot6.R ##
source("loadData.R")

source("readData.R")

library(plyr)
library(ggplot2)

motorSCC <- SCC[grepl('vehicle', SCC$SCC.Level.Two, ignore.case=T), ]
motorEMI <- merge(x=EMI, y=motorSCC, by="SCC")
motorBalEMI <- subset(motorEMI, motorEMI$fips=="24510" )
motorLAEMI <-  subset(motorEMI, motorEMI$fips=="06037")
motorBalEMI$city <- "Baltimore"
motorLAEMI$city <- "Los Angeles"

aggMotorBalAndLAEMI <- aggregate(Emissions ~ year+city, motorBalAndLAEMI, sum)

ggplot(data=motorBalAndLAEMI, aes(x=year, y=Emissions, group=fips, color=fips)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") + ggtitle("Motorcycle Related PM2.5 Emissions in Baltimore & Los Angeles (1999 - 2008)")

dev.copy(png, filename="plot6.png", width=480, height=480)
dev.off ()