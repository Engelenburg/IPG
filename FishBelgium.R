# loading the required packages
install.packages("ggplot2")
install.packages("ggmap")

sp

install.packages("rfishbase")
install.packages("rgdal")
install.packages("sp")
install.packages("raster")
update.packages("sp")
library(raster)
library(sp)
library(rfishbase)

?rgdal

#Reading in the file that has the fish occurance data in Belgium 
AllData = read.csv("D:/Documenten/Data IPG/FIsh_Belgium.csv", header=TRUE,sep="\t", dec = ".")

#Filtering out all the na values in the latitude, longitude columns
AllData <- AllData[!is.na(AllData$decimallatitude)&!is.na(AllData$decimallongitude),]

#Making coordinates out of the longitude+latitude data
coordinates(AllData)<-~decimallongitude + decimallatitude

#Setting the coordinate reference system for the map
crs(AllData)<-CRS("+init=epsg:4326")
?coordinates


AllData
plot(AllData)

#Adding points on a map
points(AllData[1:1000,], col="pink", pch='12')

#Functions for later use, to filter out data and add stuff to plots
#extract()  
#add=true  for plotting

#?raster
#?points
#?plot



readOGR
?crs
library(ggplot2)
library(ggmap)

#import and read csv file 
unique(AllData$species)
class(AllData)

# creating a sample data.frame with your lat/lon points
lon <- c(AllData$decimallongitude)
lat <- c(AllData$decimallatitude)
df <- as.data.frame(cbind(lon,lat))

# getting the map
mapgilbert <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 4,maptype = "satellite", scale = 2)

# plotting the map with some points on it
ggmap(mapgilbert) +
  geom_point(data = df, aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)



# getting the map
mapbel <- get_map(location = c(lon = 52, lat = 3), zoom = 4,maptype = c("terrain"), scale = 2)
 
                 
?get_map
# plotting the map with some points on it
ggmap(mapbel) +
  geom_point(data = , aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)



