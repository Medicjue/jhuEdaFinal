source("loadData.R")

source("readData.R")

library(plyr)

balEMI <- subset(EMI, EMI$fips=="24510")

# plot(summarySCC_PM25$Emissions, summarySCC_PM25$year)
aggBalEMI <- aggregate(Emissions ~ year, balEMI, sum)

barplot(aggBalEMI$Emissions, names.arg = aggBalEMI$year, 
        xlab = "Year", ylab = "Emissions")

### The answer is YES
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off ()
