## Please have both summarySCC_PM25.rds and Source_Classification_Code.rds in a
## folder named data in the working directory. If you don't have them this
## script is going to create a 'data' folder in your WD, download the zip and 
## extract the files in the folder. 

### This will check for the data files
if (!"data" %in% dir() || !"summarySCC_PM25.rds" %in% dir("data") || 
      !"Source_Classification_Code.rds" %in% dir("data") ){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  destFile <- "exdata-data-NEI_data.zip"
  unzippedFile1 <- "./data/summarySCC_PM25.rds"
  unzippedFile2 <- "./data/Source_Classification_Code.rds"
  
  if(!file.exists(destFile)){
    download.file(fileUrl,destfile = destFile)
  }
  if(!file.exists(unzippedFile1)||!file.exists(unzippedFile2)){
    unzip(destFile, exdir = "./data/") 
  }
}

### If the data is already stored in RAM, it will not reload it (for eficency)
if (!"neiData" %in% ls()) {
    neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
    sccData <- readRDS("./data/Source_Classification_Code.rds")
}