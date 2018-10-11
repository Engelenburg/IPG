

library(readxl)
library(reshape2)


#import and read csv and xls file 
setwd("C:/Users/rosa/Desktop/Rosa Jager 4286464/Jaar3/IPG/database/")
#Anje: "/Users/Anje/Desktop/Data/parameter_request/"
#Martijn: "/Users/mar_t/Desktop/"
#Rosa:"C:/Users/rosa/Desktop/Rosa Jager 4286464/Jaar3/IPG/database/"
#Tonyan:

data_base = read.csv("Samples.csv", header=TRUE,sep=";", dec = ".")
meta_data = read_excel("parameter_request.xls", col_names=TRUE, na = "")

Dates <- unique(data_base$Sample.Date[data_base$Parameter.Code == "MBAS"  ])
SubData <- data_base[data_base$Sample.Date %in% Dates, ]

BEL <- SubData[grep("BEL", SubData$GEMS.Station.Number),]
#Making the dataset into single rows for different pollutants so we can work it for analyses

Nice_Data<-dcast(BEL, GEMS.Station.Number +Sample.Date  ~Parameter.Code, mean, value.var = 'Value')

# make sure the names of the columns you want to match are the same
colnames(meta_data)[1]="GEMS.Station.Number"

# merge the databases based on one column with the same names
data_base2 <- merge(Nice_Data, meta_data, by="GEMS.Station.Number")

summary(data_base2)

# only use the columns that you need (i need to figure out how to exclude columns)
nicedatalocation = subset(data_base2[, c("GEMS.Station.Number", "Sample.Date", "Latitude", "Longitude", "MBAS", "BAP", "BENZENE")])
 
# nicedatalocation <- data_base2[c(1:50, 87, 86)]



