# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
# system to make a plot answering this question.


# Sets the directory.

# Checks if data exist in the enviroment.
if (!"emissionsData" %in% ls()) {
    emissionsData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}

## Process the data

# Baltimore City, Maryland (fips == "24510")
emissionsMaryland <- emissionsData[emissionsData$fips == "24510", ] 

totalEmissions <- aggregate(emissionsMaryland$Emissions, list(emissionsMaryland$year), FUN = "sum")

## Creates plot 2

#  Sets the margin
par("mar"=c(5.1, 4.5, 4.1, 2.1))

# Sets the png device
png(filename = "./figure/plot2.png", 
    width = 480, height = 480, units = "px")

plot(totalEmissions, type = "l", 
     xlab = "Year", 
     ylab = expression('Total PM'[2.5]*" Emission"),
     main = "Total Emissions in Maryland City from 1999 to 2008")

dev.off()