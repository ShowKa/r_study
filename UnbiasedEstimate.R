# unbiasedEstimate

# num=10程度だったら標本分散より、不偏分散の方が、母数に近い！
# numが増えると標本分散・不偏分散の差はすくなくなる。

len <- 10000
num <- 10

# 標本分散
sampleDist <- numeric(length=len)

# 不偏分散	
ubDist <- numeric(length=len)

for(i in 1:len) {
	sample <- rnorm(n=num, mean=50, sd=10) # 標本抽出
	sampleDist[i] <- mean( (sample - mean(sample))^2 )
	ubDist[i] <- var(sample)
}