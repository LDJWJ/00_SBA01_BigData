library(help=datasets)

data()

# CHART정리 G01-01 파이차트, 바차트
x <- c(12,15,20,6)
lable <- c("해외1팀", "해외2팀", "국내3팀", "국내4팀")
pie(x, labels=lable, main="부서별영업실적")

?pie
pie(x, labels=lable, 
    edge=200,
    radius = 2,
    main="부서별영업실적")

# 색 추가
pie(x, labels=lable, 
    edge=200,
    radius = 1,
    col = c("blue", "orange", "yellow", "red"),
    main="부서별영업실적")

pie(x, labels=lable, 
    edge=200,
    radius = 1,
    col = rainbow(length(x)),
    main="부서별영업실적")

# 외곽선 추가 
pie(x, labels=lable, 
    edge=200,
    col = c("blue", "orange", "yellow", "red"),
    main="부서별영업실적",
    border=NA)

# density 
pie(x, labels=lable, 
    edge=200,
    col = c("blue", "orange", "yellow", "red"),
    main="부서별영업실적",
    density=500,
    border=NA)

############## Bar Graph (막대 그래프)
height <- c(9,15,20,6)
name <- c("해외1팀", "해외2팀", "국내3팀", "국내4팀")

?barplot

# 01. 기본형태 
barplot(height, 
        main="부서별 영업")

# 02. x축 레이블 추가  
barplot(height, 
        names.arg=name,
        main="부서별 영업")

# 03. x축 제목, y축 제목   
barplot(height, 
        names.arg=name,
        xlab="부서",
        ylab="영업실적(억원)",
        main="부서별 영업")

# 04. xlim, ylim  x축의 값의 범위, y축의 값의 범위
# 04. width : xlim이 정의되어있을 때, Bar의 넓이 
barplot(height, 
        names.arg=name,
        xlab="부서",
        ylab="영업실적(억원)",
        xlim=c(0,10),
        ylim=c(0,30),
        width=1,
        main="부서별 영업")

# 05. 색지정 
barplot(height, 
        names.arg=name,
        xlab="부서",
        ylab="영업실적(억원)",
        xlim=c(0,10),
        ylim=c(0,30),
        width=1,
        col=c("blue", "red", "yellow", "orange"),
        main="부서별 영업")

# 06. 색지정 
barplot(height, 
        names.arg=name,
        xlab="부서",
        ylab="영업실적(억원)",
        xlim=c(0,10),
        ylim=c(0,30),
        width=1,
        col=c("blue", "red", "yellow", "orange"),
        main="부서별 영업")

#install.packages("plotrix")
library(plotrix)
x <- c(12,15,20,6)
name <- c("해외1팀", "해외2팀", "국내3팀", "국내4팀")
pie3D(x, 
      labels=name, 
      explode=0.1, 
      labelcex=1, 
      main="부서별 영업 실적")

# 데이터 라벨 출력
height <- c(12,15,20,6)
name <- c("해외1팀", "해외2팀", "국내3팀", "국내4팀")
bp <- barplot(height, 
              names.arg = name,
              main="부서별 영업 실적", 
              col=rainbow(length(height)), 
              xlab="부서",
              ylab="영업 실적(억원)",
              ylim=c(0,25))

# 데이터 라벨의 위치1 
text (x=bp, y=height, labels=round(height,0), pos=3)

# 데이터 라벨의 위치2
text (x=bp, y=height, labels=round(height,0), pos=1)

# BarChart의 수평 회전
bp <- barplot(height, 
              names.arg = name,
              main="부서별 영업 실적", 
              col=rainbow(length(height)), 
              xlab="부서",
              ylab="영업 실적(억원)",
              horiz=TRUE,
              width=50)


# 영업 1팀,2팀의 2014,2015년도 실적
height1 <- c(4,18,5,8)
height2 <- c(9,15,20,6) 

height <- rbind(height1, height2)
height

name <- c("해외1팀", "해외2팀", "국내3팀", "국내4팀")
legend_lbl <- c("2014년", "2015년")

barplot(height, 
        names.arg = name,
        main="부서별 영업 실적", 
        col=c("darkblue","red"),     # 그룹별 색 
        xlab="부서",
        ylab="영업 실적(억원)",
        legend.text = legend_lbl,
        ylim=c(0,35))



# 영업 1팀,2팀의 2014,2015년도 실적
height1 <- c(4,18,5,8)
height2 <- c(9,15,20,6) 

height <- rbind(height1, height2)
height

name <- c("해외1팀", "해외2팀", "국내3팀", "국내4팀")
legend_lbl <- c("2014년", "2015년")

barplot(height, 
        names.arg = name,
        main="부서별 영업 실적", 
        col=c("darkblue","red"),     # 그룹별 색 
        xlab="부서",
        ylab="영업 실적(억원)",
        legend.text = legend_lbl,
        beside=TRUE,   #막대들을 옆으로 배치
        args.legend=list(x='top'),
        ylim=c(0,35))


# 산점도
data(women)
women

weight <- women$weight
plot(weight)
plot(weight, type="p")    # l:선, b:점과선, c:b의 선, o:점위의 선, h:수직선, s:계단형, S"계단형, n:나타나지않음.

plot(weight, xlab="키", ylab="몸무게", 
     pch="23", col="blue", bg="yellow", cex=1.5)  # 0 : 네모, 2:세모, 3:+, ...19:색채워진원, 


# 히스토그램
data(quakes)

head(quakes)

mag <- quakes$mag
mag
hist(mag, main="지진발생강도의 분포", 
     xlab="지진강도", ylab="발생 건수")

# 히스트그램 색 넣기
colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")
hist(mag, main="지진발생의 강도의 분포", xlab="지진 강도", ylab="발생 건수", 
     col=colors, breaks=seq(4,6.5, by=0.5))

# 각 계급의 빈도를 상대도수로 나타내기
hist(mag, main="지진발생의 강도의 분포", xlab="지진 강도", ylab="발생 건수", 
     col=colors, 
     breaks=seq(4,6.5, by=0.5),
     freq=FALSE)   # probability : freq 값의 반대 

hist(mag, main="지진발생의 강도의 분포", xlab="지진 강도", ylab="발생 건수", 
     col=colors, 
     breaks="Sturges",   #계급의 수를 Sturges로 정함. 데이터가 정규 분포를 가정할 때, 사용된다.
     freq=FALSE)

# 박스 플롯
data(quakes)
mag <- quakes$mag

min(mag)
max(mag)
median(mag)
quantile(mag, c(0.25, 0.5, 0.75))

boxplot(mag, main="지진 발생 강도의 분포", xlab="지진", ylab="발생건수",
        col="red")

