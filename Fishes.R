# Install libraries
# install.packages("reshape2")
# library(reshape2)

#import and read csv file 
data_base = read.csv("/Users/mar_t/Desktop/Samples.csv", header=TRUE,sep=";", dec = ".")

#summarize data in database
summary(data_base)

#length(unique(MBAS$Sample.Date))


#access the data of header "Value" 
data_base$Value

#access the column of ParameterCodes and look for values that contain “MBAS” (Tenside measurements). If it contains “MBAS”, store in the variable MBAS. 
MBAS <- data_base[data_base$Parameter.Code == "MBAS",]

Dates <- unique(data_base$Sample.Date[data_base$Parameter.Code == "MBAS"  ])
SubData <- data_base[data_base$Sample.Date %in% Dates, ]

BEL <- SubData[grep("BEL", SubData$GEMS.Station.Number),]
#Making the dataset into single rows for different pollutants so we can work it for analyses

Nice_Data<-dcast(BEL, GEMS.Station.Number +Sample.Date  ~Parameter.Code, mean, value.var = 'Value')


?dcast
# summary(MBAS$Value)
# # MBAS$Value
# sum(MBAS$Value >10)
# unique(MBAS[MBAS$Value>1, "GEMS.Station.Number"])
# class(MBAS$value)
# str(MBAS)
# max(MBAS$value)
# ?unique
# ?cast
#length(unique(data_base[, c("GEMS.Station.Number")]))

# Worldclim2

summary(Nice_Data$"MBAS")
#?dcast

#Store all values of “MBAS” that contain “BEL” in BEL


length(unique(MBAS$GEMS.Station.Number))
coordinates(df)<- ~lat+lon plot

cbind()

match()

?match

?split
?cut
?summary

#Store all values from “BEL” that contain 1981, 1982… in variables
Y1981 = BEL[grep("1981", BEL$Sample.Date),]
Y1982 = BEL[grep("1982", BEL$Sample.Date),]
Y1983 = BEL[grep("1983", BEL$Sample.Date),]
Y1984 = BEL[grep("1984", BEL$Sample.Date),]
Y1985 = BEL[grep("1985", BEL$Sample.Date),]
Y1986 = BEL[grep("1986", BEL$Sample.Date),]
Y1987 = BEL[grep("1987", BEL$Sample.Date),]
Y1988 = BEL[grep("1988", BEL$Sample.Date),]
Y1989 = BEL[grep("1989", BEL$Sample.Date),]
Y1990 = BEL[grep("1990", BEL$Sample.Date),]

#Plot values of BEL per year in boxplot 
boxplot(Y1981$Value, Y1982$Value, Y1983$Value, Y1984$Value, 
        Y1985$Value, Y1986$Value, Y1987$Value, Y1988$Value,
        Y1989$Value, Y1990$Value,
        xlab = "year", ylab = "MBAS value in mg/L", 
        main = "BELGIUM", names = c("1981", "1982", "1983", "1984", 
                                    "1985", "1986", "1987", 
                                    "1988", "1989", "1990"))
##this is my change_TY
#Store all values of “MBAS” that contain “NLD” in NLD
NLD <- MBAS[grep("NLD", MBAS$GEMS.Station.Number),]

#Store all values from “NLD” that contain 1981, 1982… in variables
NL_Y1981 = NLD[grep("1981", NLD$Sample.Date),]
NL_Y1982 = NLD[grep("1982", NLD$Sample.Date),]
NL_Y1983 = NLD[grep("1983", NLD$Sample.Date),]
NL_Y1984 = NLD[grep("1984", NLD$Sample.Date),]

#Plot values of NLD per year in boxplot 
boxplot(NL_Y1981$Value, NL_Y1982$Value, NL_Y1983$Value, NL_Y1984$Value,
        xlab = "year", ylab = "MBAS value in mg/L", 
        main = "Netherlands", names = c("1981", "1982", "1983", "1984"))
