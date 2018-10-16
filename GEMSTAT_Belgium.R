# Install libraries
# install.packages("reshape2")
library(reshape2)

#import and read csv file 
data_base = read.csv("/Users/mar_t/Desktop/Samples.csv", header=TRUE,sep=";", dec = ".")
#Anje: "/Users/Anje/Desktop/Data/parameter_request/samples.csv"
#Martijn: "/Users/mar_t/Desktop/Samples.csv"
#Rosa:
#Tonyan:

#subset unique data 
Dates <- unique(data_base$Sample.Date[data_base$Parameter.Code == "MBAS"  ])
SubData <- data_base[data_base$Sample.Date %in% Dates, ]

#get all belgium data
BEL <- SubData[grep("BEL", SubData$GEMS.Station.Number),]

#Making the dataset into single rows for different pollutants so we can work it for analyses
Nice_Data<-dcast(BEL, GEMS.Station.Number +Sample.Date  ~Parameter.Code, mean, value.var = 'Value')

#length(unique(MBAS$GEMS.Station.Number))
#coordinates(df)<- ~lat+lon plot

#Store all values from “BEL” that contain 1981, 1982… in variables
#Y1981 = BEL[grep("1981", BEL$Sample.Date),]
#Y1982 = BEL[grep("1982", BEL$Sample.Date),]
#Y1983 = BEL[grep("1983", BEL$Sample.Date),]
#Y1984 = BEL[grep("1984", BEL$Sample.Date),]
#Y1985 = BEL[grep("1985", BEL$Sample.Date),]
#Y1986 = BEL[grep("1986", BEL$Sample.Date),]
#Y1987 = BEL[grep("1987", BEL$Sample.Date),]
#Y1988 = BEL[grep("1988", BEL$Sample.Date),]
#Y1989 = BEL[grep("1989", BEL$Sample.Date),]
#Y1990 = BEL[grep("1990", BEL$Sample.Date),]

#Plot values of BEL per year in boxplot 
#boxplot(Y1981$Value, Y1982$Value, Y1983$Value, Y1984$Value, 
#        Y1985$Value, Y1986$Value, Y1987$Value, Y1988$Value,
#        Y1989$Value, Y1990$Value,
#        xlab = "year", ylab = "MBAS value in mg/L", 
#        main = "BELGIUM", names = c("1981", "1982", "1983", "1984", 
#                                    "1985", "1986", "1987", 
#                                    "1988", "1989", "1990"))

#subset data for specific stations
BEL_1 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00001")
BEL_6 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00006")
BEL_7 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00007")
BEL_8 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00008")
BEL_9 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00009")
BEL_10 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00010")
BEL_11 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00011")
BEL_12 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00012")
BEL_13 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00013")
BEL_14 = subset(Nice_Data, Nice_Data$GEMS.Station.Number %in% "BEL00014")
