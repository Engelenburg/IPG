
# loading the required packages
# install.packages("rfishbase")
# install.packages("sp")
# install.packages("raster")
# update.packages("sp")
library(raster)
library(sp)
library(rfishbase)

#Reading in the file that has the fish occurance data in Belgium 
AllData = read.csv("D:/Documenten/Data IPG/FIsh_Belgium.csv", header=TRUE,sep="\t", dec = ".")

#Filtering out all the na values in the latitude, longitude columns
AllData <- AllData[!is.na(AllData$decimallatitude)&!is.na(AllData$decimallongitude),]

#Making coordinates out of the longitude+latitude data
coordinates(AllData)<-~decimallongitude + decimallatitude

#Setting the coordinate reference system for the map
crs(AllData)<-CRS("+init=epsg:4326")

plot(AllData)

#Adding points on a map
points(AllData[1:1000,], col="pink", pch='12')

#Functions for later use, to filter out data and add stuff to plots
#extract()  
#add=true  for plotting
