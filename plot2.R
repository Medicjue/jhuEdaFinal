### plot2.R ###
library(plyr)

### Load Data ###
tmpFileName <- "Data.zip"
if(!file.exists(tmpFileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileURL, tmpFileName)
  unzip(tmpFileName)
}

### Read Data ###
EMI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")

balEMI <- subset(EMI, EMI$fips=="24510")

# plot(summarySCC_PM25$Emissions, summarySCC_PM25$year)
aggBalEMI <- aggregate(Emissions ~ year, balEMI, sum)

barplot(aggBalEMI$Emissions, names.arg = aggBalEMI$year, 
        xlab = "Year", ylab = "Emissions")

### The answer is YES
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off ()
