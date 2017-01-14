# ChiSqr
# matrix に関連があるか調べる。
# 文系は履修率が高いが、理系は低い? ほんと？

# 帰無仮説: 2つの変数は独立である。関連はない。
# 統計検定量 χ^2	

# χ^2 が臨界値を大きく上回るため、棄却。関連あり。
# データ数が多いため。

# matrix
realValue <- c(160, 120, 40, 80)
data <- matrix(realValue, 2, 2)
rownames(data) <- c("文系", "理系")
colnames(data) <- c("履修した", "履修してない")

# χ^2 = ∑ (実現値 - 期待値)^2 / 期待値	
e1 <- 280*200/400
e2 <- 280*200/400
e3 <- 120*200/400
e4 <- 120*200/400
expected <- c(e1,e2,e3,e4)

chisqr <- sum( (realValue - expected)^2 / expected )

# 臨界値
# critical < χ^2 であれば、棄却。そうでなければ、採択
critical <- qchisq(0.05, 1, lower.tail=FALSE)

# p : 0.05を下回るので棄却。
p <- pchisq(chisqr, 1, lower.tail=FALSE)

# 関数一発。p > 0.05 なので、優位な関連はない。
result <- chisq.test(data, correct=FALSE)
