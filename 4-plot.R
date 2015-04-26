# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?


if (!"emissionsData" %in% ls()) {
    emissionsData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}

# Subsets and prepares the coal data.
coalData <- grep("coal", sccData$Short.Name, ignore.case = T)
coalData <- sccData[coalData, ]
coalData <- emissionsData[emissionsData$SCC %in% coalData$SCC, ]

# Agregate coal emissions
coalEmissions <- aggregate(coalData$Emissions, list(coalData$year), FUN = "sum")

# Creates the plot 4th.

png(filename = "./figure/plot4.png", 
    width = 480, height = 480, 
    units = "px")

plot(coalEmissions, type = "l", 
     xlab = "Year", 
     ylab = expression('Total PM'[2.5]*" Emission"),
     main = "Coal combustion-related sources from 1999 to 2008")

dev.off()