## You should have the load_data.R script in your WD before running this script

source("load_data.R")

subset <- neiData[neiData$fips == "24510", ] 
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

png(filename = "./figure/plot5.png", 
    width = 480, height = 480, 
    units = "px")

plot(motorEmissions, type = "l", xlab = "Year", col="steelBlue",
     main = "Total Emissions From Motor Vehicle Sources\n 
            From 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()