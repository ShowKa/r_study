# ChiSqr
# matrix に関連があるか調べる。
# 文系は履修率が高いが、理系は低い? ほんと？

# 帰無仮説: 2つの変数は独立である。関連はない。
# 統計検定量 χ^2	

# 結論 χ^2が臨界値を下回るため、採択できない。すなわち、関連は統計的に無し！
# データ数が少ないため、統計的な意味は見いだせなかった。

# matrix
realValue <- c(16, 12, 4, 8)
data <- matrix(realValue, 2, 2)
rownames(data) <- c("文系", "理系")
colnames(data) <- c("履修した", "履修してない")

# χ^2 = ∑ (実現値 - 期待値)^2 / 期待値	
e1 <- 28*20/40
e2 <- 28*20/40
e3 <- 12*20/40
e4 <- 12*20/40
expected <- c(e1,e2,e3,e4)

chisqr <- sum( (realValue - expected)^2 / expected )

# 臨界値
# critical < χ^2 であれば、棄却。そうでなければ、採択
critical <- qchisq(0.05, 1, lower.tail=FALSE)

# p : 0.05を上回るので採択。
p <- pchisq(chisqr, 1, lower.tail=FALSE)

# 関数一発。p > 0.05 なので、優位な関連はない。
result <- chisq.test(data, correct=FALSE)
