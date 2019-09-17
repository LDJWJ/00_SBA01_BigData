
### R과 함께 배우는 네트워크 분석 ###

## 01. 핵심 패키지 설치 

# 패키지 설치
install.packages("igraph") 
install.packages("network") 
install.packages("sna")
install.packages("visNetwork")
install.packages("threejs")
install.packages("ndtv")

install.packages("RColorBrewer") 
install.packages("png")
install.packages("networkD3")
install.packages("animation")
install.packages("maps")
install.packages("geosphere")

library(RColorBrewer)

### 02. 색 알아보기
plot(x=1:10, y=rep(5,10), pch=19, cex=5, col="dark red")
points(x=1:10, y=rep(6, 10), pch=19, cex=5, col="#557799")
points(x=1:10, y=rep(4, 10), pch=19, cex=5, col=rgb(.25, .5, .3))

## 전체 색 - 657가지의 colors 
length(colors())

## 'green'의 이름을 가진 것 알아보기
grep('green', colors(), value=T)


## rgb 컬러는 기본적으로 0-1사이의 값이다. 
## 0-255 사이의 값으로 보고 싶다면 다음과 같이 할 수 있다.
rgb(10, 100, 100, maxColorValue = 255)
col1 = rgb(10, 100, 100, maxColorValue = 255)
plot(x=1:10, y=rep(5,10), pch=19, cex=5, col=col1)


### 투명도 - Transparency /ˌtranˈsperənsē/ -
### 우리는 alpha를 이용하여 투명도 설정이 가능하다.
plot(x=1:5, y=rep(5,5), pch=19, cex=10, 
     col=rgb(.25, .5, .3, alpha=0.5), xlim=c(0,6))  

### - Palettes -
### 때로는 대조되는 여러가지 색상이 필요하다.
### R은 우리를 위해 함수를 만들어 놓았다.

pal1 <- heat.colors(5, alpha=1)   # 반투명
pal2 <- rainbow(5, alpha=.5)      # 투명

plot(x=1:10, y=1:10, pch=19, cex=10, col=pal1)
par(new=TRUE)  # 첫번째 plot를 지우지 않고, 두번째 플롯을 더한다.
plot(x=10:1, y=1:10, pch=19, cex=10, col=pal2)


### - colorRampPalette() -
### 그래디언트를 발생시키기 위해 우리는 위의 함수를 사용한다. 
### 이 함수를 이용하여 우리가 필요로 하는 수의 색을 발생시킬 수 있다.
palf <- colorRampPalette(c("gray70", "dark red"))
is(palf)
palf(10)
plot(x=10:1, y=1:10, pch=19, cex=10, col=palf(10))  # 10가지 색 

### - colorRampPalette() - 
### 우리는 여기에 투명도를 alpha를 이용하여 추가 가능하다.
palf <- colorRampPalette(c(rgb(1,1,1, 0.2), rgb(0.8, 0, 0, 0.7)), alpha=TRUE)
plot(x=10:1, y=1:10, pch=19, cex=10, col=palf(10))  # 10가지 색 

### - ~~ ColorBrewer -----
### 우리는 준비되어 있는 색상 R palettes 가 있다.
### 이 함수는 중요한 함수 하나 있다. 'brewer.pal'
### 우리는 이를 이용하여 색의 확인이 가능하다. 
### display.brewer.pal(8, "Set3")
library(RColorBrewer)

display.brewer.all()
brewer.pal.info  # 색상 정보 확인
brewer.pal.info["Blues", ]

display.brewer.pal(8, "Set3")     # Set3의 색상 보기
display.brewer.pal(8, "Spectral")
display.brewer.pal(8, "Blues")

### 03. RColorBrewer를 이용한 plot 그리기

par(mfrow=c(1,2)) # plot two figures - 1 row, 2 columns
pal3 <- brewer.pal(10, "Set3")   # Set3의 10가지 색 지정.
plot(x=10:1, y=10:1, pch=19, cex=6, col=pal3)  # 원 크기 6 지정.
plot(x=10:1, y=10:1, pch=19, cex=6, col=rev(pal3)) # backwards-색 거꾸로

dev.off() # 지정된 그래픽 구성을 없애기 위해서는 graphic device를 끈다.
detach("package:RColorBrewer")   # search() 경로로부터 이용가능한 R개체 없애기

?detach

### 04. 네트워크 데이터를 igraph로 읽기
### 데이터 다운로드 (http://bit.ly/polnet2018)
rm(list=ls())

### 작업 디렉터리 지정
setwd("D:/polnet2018") 
getwd()

library(igraph)

# 데이터 읽기
nodes <- read.csv("./Data files/Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
links <- read.csv("./Data files/Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)

## 데이터 확인
head(nodes); head(links)
dim(nodes); dim(links)

## -- graph_from_data_frame(d=links, vertices=nodes, directed=T)
## 데이터를 igraph 객체로 변환
## graph_from_data_frame() 함수는 d와 vertices 컬럼을 갖는다. 
## 소스와 대상은 node IDs를 포함한다. 
## 'vertices'는 Node IDs 컬럼으로 시작해야 한다. 
## 

net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 

class(net)
net 

?E  # 그래프의 Edges
?V  # 그래프의 Vertices 
E(net)
V(net)
E(net)$type    # hyperlink/mention
V(net)$media   # 미디어 회사명 

E(net)[type=="mention"]
V(net)[media=="BBC"]

as_edgelist(net, names=T)   # edge의 리스트를 확인
as_adjacency_matrix(net, attr="weight")

# Or data frames describing nodes and edges:
as_data_frame(net, what="edges")
as_data_frame(net, what="vertices")
?as_data_frame

# 그래프를 그리기 위한 첫번째 시도
plot(net) # not pretty!

# Removing loops from the graph:
net <- simplify(net, remove.multiple = F, remove.loops = T) 

# 화살표 크기를 줄이고, Lables 를 제거하는 것
plot(net, edge.arrow.size=.4,vertex.label=NA)

### 05. 2번째 데이터 셋 : matrix
### 데이터 읽기
nodes2 <- read.csv("./Data files/Dataset2-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <- read.csv("./Data files/Dataset2-Media-User-Example-EDGES.csv", header=T, row.names=1)

head(links2, 100)


net2 <- graph_from_incidence_matrix(links2)

table(V(net2)$type)

plot(net2,vertex.label=NA)


class(net2)
net2 

### 06. igraph를 이용한 분석 및 시각화
plot(net, edge.arrow.size=.4)



### 03. RColorBrewer를 이용한 plot 그리기
### 04. 네트워크 데이터를 igraph로 읽기 
### 05. 2번째 데이터 셋 : matrix
### 06. igraph를 이용한 분석 및 시각화 
plot(net, edge.arrow.size=.4, edge.curved=.3)  # 곡선 커브 및 방향
plot(net, edge.arrow.size=.2, edge.curved=0,
     vertex.color="orange", vertex.frame.color="#555555",
     vertex.label=V(net)$media, vertex.label.color="black",
     vertex.label.cex=.7) 

# Generate colors based on media type:
colrs <- c("gray50", "tomato", "gold")
V(net)$color <- colrs[V(net)$media.type]


# Compute node degrees (#links) and use that to set node size:
deg <- degree(net, mode="all")
V(net)$size <- deg*3
# Alternatively, we can set node size based on audience size:
V(net)$size <- V(net)$audience.size*0.7


# The labels are currently node IDs.
# Setting them to NA will render no labels:
V(net)$label.color <- "black"
V(net)$label <- NA

# Set edge width based on weight:
E(net)$width <- E(net)$weight/6

#change arrow size and edge color:
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"

# We can even set the network layout:
graph_attr(net, "layout") <- layout_with_lgl
plot(net) 

# 그래프의 edge=color을 구하기 
plot(net, edge.color="orange", vertex.color="gray50") 
plot(net) 
legend(x=-1.1, y=-1.1, c("Newspaper","Television", "Online News"), pch=21,
       col="#777777", pt.bg=colrs, pt.cex=2.5, bty="n", ncol=1)



# Sometimes, especially with semantic networks, we may be interested in 
# plotting only the labels of the nodes:

plot(net, vertex.shape="none", vertex.label=V(net)$media, 
     vertex.label.font=2, vertex.label.color="gray40",
     vertex.label.cex=.7, edge.color="gray85")


# Let's color the edges of the graph based on their source node color.
# We'll get the starting node for each edge with "ends()".
edge.start <- ends(net, es=E(net), names=F)[,1]
edge.col <- V(net)$color[edge.start]

plot(net, edge.color=edge.col, edge.curved=.1)

# Let's generate a slightly larger 100-node graph using 
# a preferential attachment model (Barabasi-Albert).

net.bg <- sample_pa(100, 1.2) 
V(net.bg)$size <- 8
V(net.bg)$frame.color <- "white"
V(net.bg)$color <- "orange"
V(net.bg)$label <- "" 
E(net.bg)$arrow.mode <- 0
plot(net.bg)




## Ref
## https://bookdown.org/rdpeng/exdata/plotting-and-color-in-r.html 
## Exploratory Data Analysis with R
## RColorBrewer : http://ftp.auckland.ac.nz/software/CRAN/doc/packages/RColorBrewer.pdf