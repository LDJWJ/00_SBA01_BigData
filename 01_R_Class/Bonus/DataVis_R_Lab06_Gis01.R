#install.packages("raster")
#install.packages("rasterVis")
#install.packages("maptools")
#install.packages("rgeos")
#install.packages("dismo")
# install.packages("XML")

library(ggmap)
library(sp)  # classes for spatial data
library(raster)  # grids, rasters
library(rasterVis)  # raster visualisation
library(maptools)
library(rgeos)
library(XML)
# and their dependencies

getwd()
setwd("C:/Users/WITHJS/Documents/R/00_Data_Vis")
# 01 일반 매핑
# - 패키지 dismp에서 gmap 함수로 Google에서 기본지도 가져오기
library(dismo)
mymap <- gmap("France")  # choose whatever country
plot(mymap)

# 02 맵 type 선택하기 
mymap <- gmap("France", type = "satellite")
plot(mymap)

# 02 맵 type 선택하기
mymap <- gmap("France", type = "satellite", exp = 3)
plot(mymap)

mymap <- gmap("France", type = "satellite", filename = "France.gmap")
plot(mymap)
mymap <- gmap("Europe")
plot(mymap)

# select.area <- drawExtent()
# # now click 2 times on the map to select your region
# mymap <- gmap(select.area)
# plot(mymap)
# # See ?gmap for many other possibilities


# export file
library(RgoogleMaps)
newmap <- GetMap(center = c(36.7, -5.9), zoom = 10, destfile = "newmap.png", 
                 maptype = "satellite")

# Now using bounding box instead of center coordinates:
newmap2 <- GetMap.bbox(lonR = c(-5, -6), latR = c(36, 37), destfile = "newmap2.png", 
                       maptype = "terrain")

# Try different maptypes
newmap3 <- GetMap.bbox(lonR = c(-5, -6), latR = c(36, 37), destfile = "newmap3.png", 
                       maptype = "satellite")

## 03. singapore 지도 불러와 랜덤하게 위치 지정.
## https://stackoverflow.com/questions/27142797/plot-data-points-on-googlemap-in-r
sing <- get_map(location = "singapore", color = "bw",
                zoom = 11, maptype = "toner", source = "google")

plot(sing)
# This is a pseudo tweets data frame including long and lat only
set.seed(12)
foo <- data.frame(long = runif(300, 103.68, 104),
                  lat = runif(300, 1.3, 1.42))
foo
ggmap(sing) +
  geom_point(data = foo, aes(x = long, y = lat), color = "red")


### 
center1 = mean( -5.5, -5.6, -5.8 )
center2 = mean( 36.3, 35.8, 36.4 )

map <- get_map(location =c(center1, center2), zoom = 9, source = "google")

# ggmap(map, fullpage = TRUE)
ggmap(map)


df <- data.frame(long = c(-5.5, -5.6, -5.8),
                  lat = c(36.3, 35.8, 36.4)  )
ggmap(map) + geom_point(data = df, aes(x = long, y = lat, size=10), color = "red")


## googleVis 사용하기 
## https://github.com/mages/googleVis
#install.packages("googleVis")
# install.packages(c("devtools","jsonlite", "knitr", "shiny", "httpuv"))
library(devtools)
install_github("mages/googleVis")

library(googleVis)
?googleVis
demo(googleVis)

require(datasets)
states = data.frame(state.name, state.x77)
G3 = gvisGeoChart(states, 
                  locationvar = "state.name", 
                  colorvar = "HS.Grad",
                  options=list(region="US", 
                               displayMode="regions", 
                               resolution="provinces",
                               width=800, height=600))
plot(G3)


library(XML)
eq <- read.csv("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv")
eq
head(eq)
names(eq)
dim(eq)
eq$loc=paste(eq$latitude, eq$longitude, sep=":")

G = gvisGeoChart(eq, "loc", "depth", "mag",
                  options=list(displayMode="Markers",
                  colorAxis="{colors:['purple', 'red', 'orange', 'grey']}",
                  backgroundColor="lightblue"), chartid="EQ")

plot(G)

## GVisOrgChart
Regions
Org <- gvisOrgChart(Regions, options=list(width=600, height=250,
                                          size='large', allowCollapse=TRUE))
plot(Org)

## Treemap
Tree <- gvisTreeMap(Regions, idvar="Region", parentvar="Parent", sizevar="Val",
                    colorvar="Fac", options=list(width=450, height=320))
plot(Tree)


## REF
## http://decastillo.github.io/googleVis_Tutorial/#25
## https://github.com/mages/googleVis

