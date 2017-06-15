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
motorBalAndLAEMI <- rbind(motorBalEMI, motorLAEMI)

aggMotorBalAndLAEMI <- aggregate(Emissions ~ year+city, motorBalAndLAEMI, sum)

g <- ggplot(aggMotorBalAndLAEMI, aes(year, Emissions, color = city))
g + geom_line() + xlab("Year") + ylab(expression("Total PM2.5 Emissions")) + ggtitle("Total Emissions from motor vehicle in Baltimore and Los Angeles")

dev.copy(png, filename="plot6.png", width=480, height=480)
dev.off ()