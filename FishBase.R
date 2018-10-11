library(rfishbase)
#source("GBIF_Belgium.R")
#Reading in the file that has the fish occurance data in Belgium 
AllDataFishData = read.csv("D:/Documenten/Data IPG/FIsh_Belgium.csv", header=TRUE,sep="\t", dec = ".")

Species <- AllData$species
UniqueBelgium <- unique(Species)

UniqueBelgiumString=c()
for (i in UniqueBelgium){
  str(i)
  UniqueBelgiumString=c(UniqueBelgiumString,i)
}

morpho <- morphology (species_list = UniqueBelgiumString)

eat <-diet(species_list = UniqueBelgiumString)

HabitatEcology <- ecology (species_list = UniqueBelgiumString)
HabitatEcosystem <- ecosystem(species_list = UniqueBelgiumString)


FrequencyofLength <- length_freq(species_list = UniqueBelgiumString)
Length <- length_length(species_list = UniqueBelgiumString)
Weigth <- length_weight(species_list = UniqueBelgiumString)
