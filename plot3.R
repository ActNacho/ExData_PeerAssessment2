## You should have the load_data.R script in your WD before running this script

source("load_data.R")

subset <- neiData[neiData$fips == "24510", ] 
library(ggplot2)


png(filename = "./figure/plot3.png", 
    width = 480, height = 480, 
    units = "px")

g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total Emissions in Baltimore City\n From 1999 to 2008")
dev.off()