## plot3.R ##
source("loadData.R")

source("readData.R")

types <- unique(EMI$type)

par(mfrow = c(2,2))

for(type in types) {
  typeEMI <- subset(EMI, EMI$type==type)
  balEMIOfType <- subset(typeEMI, typeEMI$fips=="24510")
  
  aggBalEMI <- aggregate(Emissions ~ year, balEMIOfType, sum)
  
  barplot(aggBalEMI$Emissions, names.arg = aggBalEMI$year, 
          xlab = type, ylab = "Emissions")
}

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off ()