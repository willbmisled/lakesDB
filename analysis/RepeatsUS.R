

setwd('L:/Priv/LakeMorphometry')
list.files(pattern="dbf")

x<-shell("dir/ad/b", intern = TRUE)

HUC<-c("ArkRedWhite11","California18","GreatBasin16","GreatLakes04","LowerColorado15",     
    "LowerMississippi08","LowerMissouri10L","MidAtlantic02","NorthEast01","Ohio05",
    "PacificNorthwest17","RioGrande13","SourisRedRainy09","SouthAtlanticNorth03N", 
    "SouthAtlanticSouth03S","SouthAtlanticWest03W","Tennessee06","Texas12",
    "UpperColorado14","UpperMississippi07","UpperMissouri10U")  

i=2
for(i in c(1:length(HUC))){
  load(paste('./',HUC[i],'/',HUC[i],'.RData',sep=''))  #load rdate file with morpho data for the HUC
    morphoDF$HUC<-HUC[i]  #add name of source file (HUC) to morphoDF
      if(i==1) {Morpho<-morphoDF
       }else{
      Morpho<-rbind(Morpho,morphoDF)
      }
}


a<-as.data.frame(table(Morpho$COMID))
Repeats<-a[a$Freq>1,]
