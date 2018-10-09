library(rfishbase)
source("GBIF_Belgium.R")
s <- AllData$species
Species <- unique(Species)

morpho <- morphology(species_list = Species)
eat <-diet(species_list = Species)

