library("rfishbase")
#source("GBIF_Belgium.R")
#AllData=GBIF_BEL
s <- AllData$species
ss <- unique(s)

a=c()
for (i in ss){
  str(i)
  a=c(a,i)
}

#could use lapply: much better
morpho <- morphology (species_list = a)
eat <-diet(species_list = a)
oc=length_freq(species_list = a)
#len_ana=oc[(oc$MeanLength & oc$Remark),]#len=length_weight(species_list = a)

#filtering trait length data: take average of the year, and result with 38 species with length data.
library(dplyr)
new_len = oc %>% 
  select(sciname,MeanLength,YearFrom,YearTo) %>%
  filter(!is.na(MeanLength))

ns=unique(new_len$sciname)
con=c()
df=data.frame()
for (i in ns){
  r <- new_len[new_len$sciname==i,]
  c=mean(r$MeanLength)
  con=c(con,c)}
sort_len=data.frame(ns,con)
names(sort_len)=c("specise","MeanLength_year")

#filtering trait usable morphology data
new_morpho = morpho %>% 
  select(sciname,DorsalSpinesMin,DorsalSpinesMax,DorsalSoftRaysMin,DorsalSoftRaysMax) %>%
  filter(!is.na(DorsalSpinesMin)) %>% filter(!is.na(DorsalSpinesMax)) %>% filter(!is.na(DorsalSoftRaysMin))%>% filter(!is.na(DorsalSoftRaysMax))
a1=(new_morpho$DorsalSpinesMin + new_morpho$DorsalSpinesMax)/2
a2=(new_morpho$DorsalSoftRaysMin + new_morpho$DorsalSoftRaysMax)/2
new_morpho=data.frame(new_morpho$sciname,a1,a2)
names(new_morpho)=c("Specise","DorsalSpines","DorsalSoftRays")

#filtering the trophy
new_diet = eat %>% 
  select(sciname,Troph) %>%
  filter(!is.na(Troph))

#library(reshape2)

## the next step is start from the Gibf then 

#could use the non-parametrer for the not normal distribution
# the specise name could be a problem, check them
FishBase_specise_BEL <- read_delim("FishBase_specise_BEL.csv", ";", escape_double = FALSE, trim_ws = TRUE)

fishbase_s=FishBase_specise_BEL$Species
gibif_s=a


