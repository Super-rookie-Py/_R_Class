# keonwoo Park 2020/10/07

x <- c(3.0, 6.0, 9.0, 12.0)
y <- c(3.0, 4.0, 5.5, 6.5)
x; y

m <- lm(y~x)
m

# 매개변수 확인
coef(m)

# 훈련 집합의 예측값
fitted(m)

# 오차(잔차)
residuals(m)

# 평균 제곱오차 편차제곱합 : deviance
deviance(m)
deviance(m) / length(x)

# 모델 자세히 살펴보기 : summary
summary(m)

# 모델을 이용한 예측 : predict
## 새로운 데이터
newx <- data.frame(x=c(1.2, 2.0, 20.65))
newx
predict(m, newdata = newx)
