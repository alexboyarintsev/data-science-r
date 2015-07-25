pollutantmean <- function(directory, pollutant, id = 1:332) {
    setwd("C:/work/my-projects/Data Science/data-science-r/working-directory")
    allData <- 0
    for (fileid in id) {
        print(fileid)
        if (fileid < 10) {
            fileid <- paste("00", fileid, sep = "")
        } else if (fileid < 100) {
            fileid <- paste("0", fileid, sep = "")
        }
        filename <- paste(fileid, ".csv", sep = "")
        path <- paste(directory, filename, sep = "/")
        inputData <- read.csv(path, head= TRUE, sep = ",")
        inputData <- na.omit(inputData)
        allData <- merge(allData, inputData, all = TRUE)
    }
    mean(allData[,pollutant], na.rm = TRUE)
}




## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!