# 統計量 Tの分布の確認
# T = ( 標本平均 - 母平均 ) / ( 不偏標準偏差 / √標本数 )

len = 100000
num = 4
t = numeric(length = len)
for (i in 1 : len) {
	
	# 平均0の母集団からランダムにデータを引き出す。
	data <- rnorm(n=num, mean=0, sd=1)

	# Tの計算
	m <- mean(data)
	s <- sqrt(var(data))
	t[i] <- m / (s / sqrt(num))
}

# 答え合わせ
# Tのヒストグラムと、実際のT分布の確率密度を重ね合わせてみる。

# 自由度=num のT分布
# curve(dt(x,num),-5,5) 

# 上記で計算したTのヒストグラム
# hist(t, breaks=500, freq=FALSE, xlim=c(-5,5), add=TRUE)