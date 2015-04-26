# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system 
# to make a plot answer this question.

# Imports the used libraries.
library(ggplot2)

if (!"emissionsData" %in% ls()) {
    emissionsData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}

# Subsets the Baltimore City data.
baltimoreEmissions <- emissionsData[emissionsData$fips == "24510", ] 

# Creates the 3th plot

png(filename = "./figure/plot3.png", 
    width = 480, height = 480, 
    units = "px")

gPlot <- ggplot(baltimoreEmissions, aes(year, Emissions, color = type))

gPlot + geom_line(stat = "summary", fun.y = "sum") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()