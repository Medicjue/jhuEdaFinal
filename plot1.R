source("loadData.R")

source("readData.R")

library(plyr)

# plot(summarySCC_PM25$Emissions, summarySCC_PM25$year)
aggEMI <- aggregate(Emissions ~ year, EMI, sum)

barplot(aggEMI$Emissions/10^6, names.arg = aggEMI$year, 
        xlab = "Year", ylab = "Emissions")

### The answer is YES
dev.copy(png, filename="plot1.png", width=480, height=480)
dev.off ()
