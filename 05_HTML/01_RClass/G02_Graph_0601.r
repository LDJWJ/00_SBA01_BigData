# ggplot2

# 01 패키지 및 데이터 불러오기
rm(list=ls())
install.packages("ggplot2")
library(ggplot2)
search()

data(mtcars)
qplot(mtcars$wt, mtcars$mpg)

# 02 qplot 
qplot(mtcars$wt, mtcars$mpg)

# 03 위와 같음
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()

# 04 선그래프 만들기
# Data on the relation between temperature in degrees 
# Celsius and vapor pressure of mercury in millimeters (of mercury).
?pressure
?qplot
pressure
qplot(temperature, 
        pressure, 
        data=pressure,
        geom="line"
      )

xlab <- c(1,2,3,45,66)
ylab <- c(20,30,40,50,60)
data_f <- data.frame(xlab, ylab)
qplot(xlab, 
      ylab, 
      data=data_f,
      geom="line"
)

# ggplot2
ggplot(pressure, 
       aes(x=temperature, y=pressure)) +
      geom_line() +
      geom_point()

# 05 막대 그래프
# 데이터 셋 : mtcars
mtcars$cyl
qplot(factor(cyl), data=mtcars)
ggplot(mtcars, aes(x=factor(cyl))) + 
  geom_bar()

# 06 히스토그램 
# 데이터 셋 : mtcars
?hist
mtcars$mpg
hist(mtcars$mpg, breaks=10)

?qplot()
qplot(mpg, data=mtcars, binwidth=1)

ggplot(mtcars, aes(x=mpg)) + 
        geom_histogram(binwidth=1)

# 07 Box Plot 
# 데이터 셋 : mtcars
?boxplot
?ToothGrowth
str(mtcars)
ToothGrowth
boxplot(len~supp , data=ToothGrowth)

?qplot()
qplot(supp, len,
      data=ToothGrowth, 
      geom="boxplot")


library(ggplot2)
ggplot(ToothGrowth, aes(x=supp, y=len)) +
       geom_boxplot()


# ggplot stat
# dataset : gcookbook
?gcookbook
?ggplot
# install.packages("gcookbook")
library(gcookbook)
ggplot(pg_mean, aes(x=group, y=weight)) + 
  geom_bar(stat="identity")

# 색 넣기, 외곽선색(검정)
ggplot(pg_mean, aes(x=group, y=weight)) +
    geom_bar(stat="identity",
             fill="lightblue",
             colour="black")

# 이변량 변수 표시(1)
cabbage_exp
search()
ggplot(cabbage_exp, 
       aes(x=Date, y=Weight, fill=Cultivar)) +
       geom_bar(stat="identity",position="dodge")

# 이변량 변수 표시(2-1) palette
ggplot(cabbage_exp, 
       aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity",position="dodge") +
  scale_fill_brewer(palette="Pastel1")

# 이변량 변수 표시(3) guides(fill=guide_legend(reverse=TRUE))
ggplot(cabbage_exp, 
       aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity") +
  guides(fill=guide_legend(reverse=TRUE))

# 이변량 변수 표시(2-2) 숫자 레이블 추가 
ggplot(cabbage_exp, 
      aes(x=interaction(Date, Cultivar), y=Weight)) +
      geom_bar(stat="identity") +
      geom_text(aes(label=Weight), vjust=1.5, colour="white")

ggplot(cabbage_exp, 
       aes(x=interaction(Date, Cultivar), y=Weight)) +
      geom_bar(stat="identity") +
      geom_text(aes(label=Weight), vjust=-0.2)

