# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Gets the data. 
if (!"emissionsData" %in% ls()) {
    emissionsData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}

# Gets the Baltimore City emissions data.
baltimoreCity <- emissionsData[emissionsData$fips == "24510", ]

motorData <- grep("motor", sccData$Short.Name, ignore.case = T)
motorData <- sccData[motorData, ]
motorData <- baltimoreCity[baltimoreCity$SCC %in% motorData$SCC, ]
vehicleEmissions <- aggregate(motorData$Emissions, list(motorData$year), FUN = "sum")

# Creates the plot 5th

png(filename = "./figure/plot5.png", 
    width = 480, height = 480, 
    units = "px")

plot(vehicleEmissions, type = "l", 
     xlab = "Year", 
     ylab = expression('Total PM'[2.5]*" Emission"),
     main = "Emissions from motor vehicle sources \n in Baltimore City \n from 1999 to 2008 ")

dev.off()
