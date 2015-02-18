## You should have the load_data.R script in your WD before running this script

source("load_data.R")
library(ggplot2)
subset <- neiData[neiData$fips == "24510"|neiData$fips == "06037", ]
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

png(filename = "./figure/plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
    scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()