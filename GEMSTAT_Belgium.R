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

#let R know that Sample.Data are in format year-month-day
Nice_Data <- as.Date(Nice_Data$Sample.Date, "%Y-%m-%d")

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


#Plotting MBAS Values of stations 1-13 in grid plot 

library(ggplot2)
library(cowplot)

plot_bel1 = ggplot(data=BEL_1, aes(x=as.Date(BEL_1$Sample.Date), y=BEL_1$MBAS, group=1)) +
  geom_line(color="yellow")+
  geom_point(size=0.7) + 
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8)) 

plot_bel6 = ggplot(data=BEL_6, aes(x=as.Date(BEL_6$Sample.Date), y=BEL_6$MBAS, group=1)) +
  geom_line(color="pink") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel7 = ggplot(data=BEL_7, aes(x=as.Date(BEL_7$Sample.Date), y=BEL_7$MBAS, group=1)) +
  geom_line(color="red") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel8 = ggplot(data=BEL_8, aes(x=as.Date(BEL_8$Sample.Date), y=BEL_8$MBAS, group=1)) +
  geom_line(color="green") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel9 = ggplot(data=BEL_9, aes(x=as.Date(BEL_9$Sample.Date), y=BEL_9$MBAS, group=1)) +
  geom_line(color="brown") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel10 = ggplot(data=BEL_10, aes(x=as.Date(BEL_10$Sample.Date), y=BEL_10$MBAS, group=1)) +
  geom_line(color="blue") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel11 = ggplot(data=BEL_11, aes(x=as.Date(BEL_11$Sample.Date), y=BEL_11$MBAS, group=1)) +
  geom_line(color="darkgreen") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel12 = ggplot(data=BEL_12, aes(x=as.Date(BEL_12$Sample.Date), y=BEL_12$MBAS, group=1)) +
  geom_line(color="purple") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_bel13 = ggplot(data=BEL_13, aes(x=as.Date(BEL_13$Sample.Date), y=BEL_13$MBAS, group=1)) +
  geom_line(color="darkblue") +
  geom_point(size=0.7) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_text(size=8), axis.text.y=element_text(size=8))

plot_grid(plot_bel1, plot_bel6, plot_bel7,plot_bel8, plot_bel9, plot_bel10, plot_bel11, plot_bel12, plot_bel13)

#Plotting Tensides and MBAS of station 7
ggplot(data=BEL_7, aes(as.Date(BEL_7$Sample.Date))) + 
  geom_line(aes(y=BEL_7$MBAS, colour = "red")) + geom_line(aes(y=BEL_7$NH3N, colour = "blue")) 

# Calculating Pearson's product-moment correlation
cor.test(BEL_7$MBAS, BEL_7$NH3N, method = "pearson")

