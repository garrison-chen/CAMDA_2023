## install iNEXT package from CRAN
install.packages("iNEXT")

## install iNEXT from github
install.packages('devtools')
library(devtools)
install_github('AnneChao/iNEXT')

## import packages
library(iNEXT)
library(ggplot2)

## test data 
data(spider)
DataInfo(spider, datatype = "abundance")
spider$Girdled
spider$Logged
out <- iNEXT(spider, q = c(0, 1, 2), datatype="abundance", endpoint=400)
# Sample-size-based R/E curves, separating plots by "Assemblage"
ggiNEXT(out, type=1, facet.var="Assemblage")
ggiNEXT(out, type=1, facet.var="Order.q")

data(bird)
DataInfo(bird, datatype = "abundance")
bird$North.site
bird$South.site
out <- iNEXT(bird, q = c(0, 1, 2), datatype="abundance", endpoint=400)
# Sample-size-based R/E curves, separating plots by "Assemblage"
ggiNEXT(out, type=1, facet.var="Assemblage")
ggiNEXT(out, type=1, facet.var="Order.q")

data("ciliates")
DataInfo(ciliates, datatype = "incidence_raw")
ciliates$EtoshaPan
ciliates$CentralNamibDesert
ciliates$SouthernNamibDesert
out <- iNEXT(ciliates, datatype = "incidence_raw")
ggiNEXT(out)

## CAMDA data 
nyc <- read.table("Desktop/WIBI/PhD/Conferences/ISMB-CAMDA2023/iNEXT/NYC_rgi-meta", header = FALSE, sep = "", dec = ".")
den <- read.table("Desktop/WIBI/PhD/Conferences/ISMB-CAMDA2023/iNEXT/DEN_rgi-meta", header = FALSE, sep = "", dec = ".")
san <- read.table("Desktop/WIBI/PhD/Conferences/ISMB-CAMDA2023/iNEXT/SAN_rgi-meta", header = FALSE, sep = "", dec = ".")
sac <- read.table("Desktop/WIBI/PhD/Conferences/ISMB-CAMDA2023/iNEXT/SAC_rgi-meta", header = FALSE, sep = "", dec = ".")
bal <- read.table("Desktop/WIBI/PhD/Conferences/ISMB-CAMDA2023/iNEXT/BAL_rgi-meta", header = FALSE, sep = "", dec = ".")
min <- read.table("Desktop/WIBI/PhD/Conferences/ISMB-CAMDA2023/iNEXT/MIN_rgi-meta", header = FALSE, sep = "", dec = ".")

camda <- list(BAL = bal$V1, DEN = den$V1, NYC = nyc$V1, MIN = min$V1, SAC = sac$V1, SAN = san$V1)
DataInfo(camda, datatype = "incidence_freq")
out_camda <- iNEXT(camda, q = 0, datatype="incidence_freq", endpoint = 100, conf = 0.95)
plot <- ggiNEXT(out_camda, type=1)

plot <- plot +
  labs(
    title = "Rarefaction and Extrapolation analysis",
    x = "Number of samples",
    y = "Number of ARG"
  ) +
  ggtitle("Rarefaction and Extrapolation analysis") +
  theme(plot.title = element_text(hjust = 0.5))

print(plot)

