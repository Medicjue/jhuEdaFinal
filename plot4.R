## plot4.R ##
source("loadData.R")

source("readData.R")

library(plyr)
library(ggplot2)

coalSCC <- SCC[grepl('Coal', SCC$Short.Name, fixed=T), ]
coalEMI <- merge(x=EMI, y=coalSCC, by="SCC")

aggCoalEMI <- aggregate(Emissions ~ year, coalEMI, sum)

ggplot(data = aggCoalEMI, aes(x=year, y=Emissions)) + geom_line() + geom_text(aes(label=Emissions), vjust=1)+ geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (thousands of tons)" ) + ggtitle("Total United States PM2.5 Coal Emissions")

### The answer is YES
dev.copy(png, filename="plot4.png", width=480, height=480)
dev.off ()


barplot(aggCoalEMI$Emissions, names.arg = aggCoalEMI$year, 
        xlab = "Year", ylab = "Emissions")

dev.copy(png, filename="plot4_bar.png", width=480, height=480)
dev.off ()
