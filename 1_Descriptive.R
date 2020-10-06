# keonwoo Park 2020/10/07

# 단순 임의 추출
## 비 복원 추출

dt<-iris$Petal.Length
str(dt)
sample(dt, 10)

## 복원 추출
sample(dt, 10, replace = T)

sample(1:5, 5)
sample(1:5, 5, replace=T)

## 가중치를 고려한 추출
sample(1:5, 5, replace = T, prob = c(10, 20, 20, 50, 1))

## 층화 임의 추출: sampling::strata
install.packages("sampling")
library(sampling)

## strata
x <- strata(data= iris, stratanames = c("Species"), size = c(3, 3, 3), method = "srswor")
x

## getdata
getdata(iris, x)

## 층마다 다른 수의 표본 추출
x <- strata(data= iris, stratanames = c("Species"), size = c(3, 2, 3), method = "srswr")

iris$Species2 <- rep(1:2, time=75)
iris

## 다수의 층에서 표본 추출
x <- strata(data= iris, stratanames = c("Species","Species2"),
            size = c(1,2,1,2,1,2), method = "srswor")
x

## 계통 추출 : doBy::sample_by
install.packages("doBy")
library(doBy)

x <- data.frame(x = 1:10)
x
sample_by(data = x, formula = ~1, frac = 0.2, systematic = T)
sample_by(data = iris, formula = ~Species, frac = .2,systematic = T)

# 기술 통계
## 평균
mean(dt)

## 표본 분산
var(dt)

## 자유도 확인
df <- length(dt)-1
m <- mean(dt)

var_dt <- sum((dt - m) ^ 2)/df

## 표본 표준편차
sd(dt)
var_dt^0.5

# 5 number summary : min, 1Q, 2Q(median), 3Q, max
fivenum(dt)
summary(dt)

## 최빈값
## 분할표 작성
max(table(dt))
which.max(table(dt))
names(table(dt))[5]

# 검정을 위한 분할표 작성 : table, xtabs
table(iris$Species)

xtabs(~Species, data = iris)

d<- data.frame(x= c("1","2","2","1"),
               y = c("A","B","A","B"),
               num = c(3,5,8,7))
d
xtabs(num ~ x + y, data = d)

# 합계산 : margin.table
xt <- xtabs(num~ x+y, data = d)
margin.table(xt, 1)
margin.table(xt, 2)
margin.table(xt)

# 비율 계산 : prop.table
xt
prop.table(xt, 1)
prop.table(xt, 2)
prop.table(xt)


# 독립성 검정
## 데이터 로드 : MASS::survey
library(MASS)
data(survey)
str(survey)

# 성별 : Sex, 운동의 정도 : Exer 
ta <- xtabs(~ Sex + Exer, data = survey)
ta
chisq.test(xtabs(~ Sex + Exer, data = survey))

xtabs(~ W.Hnd + Clap, data = survey)
chisq.test(xtabs(~ W.Hnd + Clap, data = survey))
 
fisher.test(xtabs(~ W.Hnd + Clap, data = survey))

# 맥니머 검정
Performance <-
  matrix(c(794, 86, 150, 570),
         nrow = 2,
         dimnames = list("1st Survey" = c("Approve", "Disapprove"),
                         "2nd Survey" = c("Approve", "Disapprove")))
Performance
mcnemar.test(Performance)

# t-test
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

## compact, suv 자동차의 도시 연비 차이가 있는가 ?

mpg_diff <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)

## 일반 휘발유와 고급 휘발유의 도시 연비 차이가 있는가 ?

mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))
table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty~fl, var.equal = T) # p-value 0.2857 라서 귀무가설 기각 불가 도시 연비 차이에 영향을 주지 않음.

# 상관분석
economics <- as.data.frame(ggplot2::economics)
str(economics)
cor.test(economics$unemploy, economics$pce)

# 상관행렬
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor, 2)

# 히트맵
install.packages("corrplot")
library(corrplot)
corrplot(car_cor)
corrplot(car_cor, cmethod = "number")
corrplot(car_cor,method = "color",
        type="lower",
        order = "hclust",
        addCoef.col = "black",
        tl.col = "gray",
        tl.srt = 45,
        diag =F)
