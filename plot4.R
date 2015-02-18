## You should have the load_data.R script in your WD before running this script

source("load_data.R")
coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- neiData[neiData$SCC %in% coal$SCC, ]
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

png(filename = "./figure/plot4.png", 
    width = 480, height = 480, 
    units = "px")

plot(coalEmissions, type = "l", xlab = "Year", col="steelBlue",
     main = "Total Emissions from coal combustion-related sources\n 
             across the United States From 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()