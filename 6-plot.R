# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

# Loads the libraries
library(ggplot2)

# Gets the data. 
if (!"emissionsData" %in% ls()) {
    emissionsData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}

# baltimoreCaliforniaData baltimore and california data
subset <- emissionsData[emissionsData$fips == "24510" | emissionsData$fips == "06037", ]

motorData <- grep("motor", sccData$Short.Name, ignore.case = T)
motorData <- sccData[motorData, ]
motorData <- subset[subset$SCC %in% motorData$SCC, ]

# Creates the 6th plot

png(filename = "./figure/plot6.png", 
    width = 480, height = 480, 
    units = "px")

gPlot <- ggplot(motorData, aes(year, Emissions, color = fips))
gPlot + geom_line(stat = "summary", fun.y = "sum") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle("Total Emmission of Motor Vehicle Sources \n Baltimore City vs Los Angeles County \n from 1999 to 2008") +
        scale_colour_discrete(name = "Group", 
        label = c("Los Angeles","Baltimore City"))

dev.off()