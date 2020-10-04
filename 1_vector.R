# keonwoo Park 2020/10/05

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
x
lg <- c(TRUE, FALSE, FALSE)
lg
y <- c(x, 0, x)
y
assign("z", c(10.4, 5.6, 3.1, 6.4, 21.7))
z

# 연속형 벡터 생성

s1 <- seq(length=51, from = -5, by = .2)
s1
s2 <- rep(1:5, times=5)
s2
s3 <- rep(1:5, each=5)
s3


# 결합형 벡터 생성

labs <- paste(c("X","Y"), 1:10, sep="-")
labs

# 벡터 요소에 이름 부여

fruit <- c(5, 10, 1, 20)
names(fruit) <- c("orange","banana", "apple","peach")
fruit

# 벡터 인덱스

fruit["apple"]
fruit[c("apple", "orange")]

x <- c(11:15)
x
x[2]
x[3:4]
x[c(1,3,5)]
x[-2]
x[-c(2, 4)]
x[x > 12]
x[x >= 12 & x <= 14]
x[2] <- 20
x[c(3, 4)] <- 30
x[x < 30] <- 10; x
x[-2] <- 100; x

# 데이터 형태 변환

z <- 0:9
z
mode(z)
d_chr <- as.character(z)
d_chr
mode(d_chr)
d <- as.integer(d_chr)
d
mode(d)

# 산술 연산

10 + 3
10 - 3
10 * 3
10 / 3
10 ** 3
10 ^ 3
10 %% 3
10 %/% 3

# 비교 연산

10 < 3
10 > 3
10 == 3
10 != 3

# 논리 연산

TRUE | TRUE
TRUE | FALSE
TRUE & TRUE
TRUE & FALSE
!TRUE
!FALSE
isTRUE(TRUE)
isTRUE(FALSE)
isFALSE(TRUE)
isFALSE(FALSE)

# 집합 연산

x <- c(1, 2, 3)
y <- c(3, 4, 5)
z <- c(3, 1, 2)

union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)
setequal(x, y)
setequal(x, z)

# 벡터 요소 간 연산

w <- c(1, 2, 3, 4)
x <- c(5, 6, 7, 8)
y <- c(3, 4)
z <- c(5, 6, 7)
w; x; y; z

w + y
w + x 
w + z

# 벡터 다루기

x <- 10:20 ;x
any(x > 15)
all(x > 15)
which(x > 15)
x[which(x>15)]
subset(x, x > 15)

# 결측치 다루기

x <- c(32, 1, NA, 46, 8)
y <- c(32, 1, NULL, 46, 8)
x; y
mean(x)
mean(x, na.rm = T)
mean(y)

c(1, 'a')
c(1, 1.1)
c(1, 1.1, 'a')

ch <- c('a', 'b','c')
num <- c(1, 2,3)
ch + num            # 사용 불가
