## plot3.R ##
library(ggplot2)

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

aggBalEMI <- aggregate(Emissions ~ year+type, balEMI, sum)

ggplot(data=aggBalEMI, aes(x=year, y=Emissions, group=type, color=type)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") 

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off ()