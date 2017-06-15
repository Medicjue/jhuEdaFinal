## plot3.R ##
source("loadData.R")

source("readData.R")

library(ggplot2)

balEMI <- subset(EMI, EMI$fips=="24510")

aggBalEMI <- aggregate(Emissions ~ year+type, balEMI, sum)

ggplot(data=aggBalEMI, aes(x=year, y=Emissions, group=type, color=type)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") 

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off ()