# keonwoo Park 2020/10/06

# 데이터 정재

data <- c(10, NA, 30, NA, 45)
data
data[is.na(data)]
data[!is.na(data)]

df <- data.frame(name = c("John", "Amy", "Steve"),
                 age = c(200, 16, 23),
                 gender = c("M", "F", "N"))
df[df$gender == "N", ]
df[df$age > 120 | df$age < 0, ]

# 조건문

x <- 5
if(x %% 2 == 0){
  print("짝수")
}else {
  print("홀수")
}

x <- -1
if (x > 0) {
  print("positive")
}else if (x < 0) {
  print("negative")
}else {
  print("zero")
}

city <- "Seoul"
ifelse(city == "Seoul" , "korea", "Other country")

df
df[,2] <- ifelse(df[,2] > 120 | df[,2] < 0, NA , df[, 2])
df
df[,3] <- ifelse(df[,3] %in% c("F", "M"), df[, 3], NA)
df

# 반복문

i <- 1
repeat{
  if(i > 10){
    break
  } else {
    print(i)
    i <- i + 1
  }
}


i <- 1
while(i <= 10){
  print(i)
  i <- i + 1
}

for(i in 1:10){
  print(i)
}

data <- data.frame(kor = c(100, 90, 120, 80),
                   eng = c(90, 80, -10, 70),
                   mat = c(800, 90, 70, -100))
data

for (i in 1:3){
  data[, i] <- ifelse(data[,i] >= 0 & data[, i] <= 100, data[, i], NA)
}

data


# 사용자 정의 함수

sumAtoB <- function(startNum = 1, endNum=10){
  s <- 0
  for(i in startNum:endNum){
    s <- s + i
  }
  return(s)
}

sumAtoB()
sumAtoB(startNum=10, endNum=15)
sumAtoB(endNum = 15, startNum = 10)
sumAtoB(10, 15)
sumAtoB(start = 10, end = 15)

str(airquality)
table(is.na(airquality))

na.cnt <- function(x) {
  table(is.na(x))
}

na.cnt(airquality)
na.cnt(airquality$Solar.R)

# 결측값 처리

colSums(is.na(airquality))

air <- airquality
air_del <- na.omit(air)
na_del <- is.na(air_del)
colSums(na_del)

mean(airquality$Ozone)
m_ozone <- mean(airquality$Ozone, na.rm = T)
air <- airquality
air$Ozone[is.na(air$Ozone)] <- m_ozone
na.cnt(air$Ozone)

# 이상치 확인

air <- airquality
boxplot(air$Ozone)$stats

air$Ozone <- ifelse(air$Ozone > 122, NA , air$Ozone)
boxplot(air$Ozone)
