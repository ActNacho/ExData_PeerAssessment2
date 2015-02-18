## You should have the load_data.R script in your WD before running this script

source("load_data.R")

totalEmissions <- aggregate(neiData$Emissions/1000000, 
                            list(neiData$year), 
                            FUN = "sum")

png(filename = "./figure/plot1.png", 
    width = 480, height = 480, 
    units = "px")

plot(totalEmissions, type = "l", xlab = "Year", col="steelBlue",
     main = "Total Emissions in the United States\n From 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission (in millions)"))
dev.off()