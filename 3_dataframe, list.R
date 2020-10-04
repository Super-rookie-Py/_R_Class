# keonwoo Park 2020/10/05

exam <- read.csv("data/exam.csv")
exam
str(exam)

mean(exam$korean)
mean(exam$english)
mean(exam$math)
mean(exam$science)

data.frame(kor = mean(exam$korean),
           eng = mean(exam$english),
           mat = mean(exam$math),
           sci = mean(exam$science))

apply(exam[c(3:6)], 2, mean)

# 데이터 프레임 함수

str(exam)
str(cars)

attributes(exam)
attributes(cars)

dim(exam)
dim(cars)

ncol(exam) ; nrow(exam)
ncol(cars) ; nrow(cars)

names(exam); colnames(exam)
rownames(cars); row.names(cars)

summary(exam)
summary(cars)

head(cars)
head(cars, 3); tail(cars,3)

sum(exam$korean)
attach(exam)
sum(korean)
sum(english)
mean(math)

detach(exam)
sum(korean) # 사용불가

mean(exam$english)
with(exam, mean(english))
with(exam, mean(math))

subset(exam, korean >= 80, select= c(name, korean, english))

mean(exam$math)
subset(exam, math< mean(math), select = -c(std_no))

subset(exam, english == max(english))

# 데이터프레임 병합 join 문과 비슷

d1 <- data.frame(kids = c("Jack", "Jane", "John", "Lily"),
                 states = c("CA", "NY", "NV", "TX"))
d1

d2<- data.frame(kids = c("Jane", "Jack", "Kevin"),
                age = c(10, 12, 8))
d2

d3 <- data.frame(age = c(10, 12, 8),
                 name = c("Jane", "Jack", "Kevin"))
d3

merge(d1, d2)
merge(d1, d3, by.x = "kids", by.y = "name")
merge(d1, d3, by.x = "kids", by.y = "name", all = T)
merge(d1, d3, by.x = "kids", by.y = "name", all.x = T)

# 데이터 프레임 확인 및 변환

x <- array(1:9, c(3,3))
x
is.data.frame(x)
is.data.frame(exam)

x <- as.data.frame(x)
x
is.data.frame(x)
names(x) <- paste("Col", 1:3)
x

# 데이터 프레임 저장 (파일 출력)

write.csv(exam, "data/exam_df.csv")
write.csv(exam, "data/exam_df.csv", quote = F,
          row.names=F, fileEncoding = 'utf-8')


# 리스트

lst <- list(name = "Fred", wife = "Amy", no.children = 3, child.age = c(4,7,9))
lst

lst$wife
lst[[2]]
lst[["wife"]]

class(lst$wife)

lst["wife"]
lst[2]

class(lst["wife"])
class(lst[["wife"]])

lst$child.age[2]
lst$country <- c("Canage")
lst

lst$child.age <- lst$child.age + 1
lst

names(lst)
names(lst)[1] <- "family"
names(lst)
lst

lst["country"] <- NULL
lst

new_list <- c(lst, list(country="Canada"))
new_list

length(new_list)

# 리스트 함수

unlst <- unlist(new_list)
unlst

unlst$family # 벡터라서 조회 불가
unlst[1]
unlst["family"]

x <- list(a=1:3, b=4:6)
x
lapply(x, mean)

head(iris, 5)
res_l <- lapply(iris[-5], mean)   # 리스트로 반환

res_s <- sapply(iris[1:4], mean)  # 벡터 반환

class(res_l)
class(res_s)
