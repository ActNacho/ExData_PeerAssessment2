## You should have the load_data.R script in your WD before running this script

source("load_data.R")

subset <- neiData[neiData$fips == "24510", ] 
totalEmissions <- aggregate(subset$Emissions, 
                            list(subset$year), 
                            FUN = "sum")
png(filename = "./figure/plot2.png", 
    width = 480, height = 480, 
    units = "px")

plot(totalEmissions, type = "l", xlab = "Year", col="steelBlue",
     main = "Total Emissions in Baltimore City\n From 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()