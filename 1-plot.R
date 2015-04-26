# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Sets the directory.
# setwd(paste(c(getwd(), "/GitHub/ExData_CourseProject2/"), collapse=""))

# sets the variables
if (!"neiData" %in% ls()) {
    neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}



# Gets the total emissions by year.
totalEmissions <- aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")

# Creates the plot 1

# Sets the margins
par("mar"=c(5.1, 4.5, 4.1, 2.1))

png(filename = "./figure/plot1.png", width = 480, height = 480, units = "px")

plot(totalEmissions, type = "l", 
     xlab = "Year", 
     ylab = expression('Total PM'[2.5]*" Emission"),
     main = "Total Emissions in the United States from 1999 to 2008")

# Draw it.
dev.off()


