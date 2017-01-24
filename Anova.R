
n <- 5

# scoreは昇順に並び替える（生徒Eが一番頭がよい）
A <- sort(rnorm(n, mean = 100, sd = sqrt(10)))
B <- sort(rnorm(n, mean = 100, sd = sqrt(10)))
C <- sort(rnorm(n, mean = 104, sd = sqrt(10)))

score <- c(A, B, C)
subject <- factor(c(rep("線形代数", n), rep("微分積分", n), rep("統計", n)))

# no correspondence : 対応なしの場合
result_no_cor <- summary(aov(score~subject))

# correspondence : 対応有りの場合
student <- factor(rep(c("生徒A", "生徒B", "生徒C", "生徒D", "生徒E"), 3))
result_cor <- summary(aov(score~subject+student))

# tukey-karamer検定
tukey_result <- TukeyHSD((aov(score~subject+student)))
