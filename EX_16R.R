dane <- read.csv("C:/Users/kacpe/Downloads/rna_seq_data (1).csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 stringsAsFactors = FALSE
)
print(dane)
summary(dane)
mean(dane$Expression_Level)
median(dane$Expression_Level)
min(dane$Expression_Level)
max(dane$Expression_Level)
sd(dane$Expression_Level)
quantile(dane$Expression_Level)
wynik <- aggregate(Expression_Level ~ Condition, data = dane,
          FUN = function(x) c(
            mean = mean(x, na.rm = TRUE),
            median = median(x, na.rm = TRUE),
            min = min(x, na.rm = TRUE),
            max = max(x, na.rm = TRUE),
            sd = sd(x, na.rm = TRUE),
            Q1 = quantile(x, 0.25, na.rm = TRUE)
          ))
wynik <- do.call(data.frame, wynik)
print(wynik)

library("moments")
skewness(dane$Expression_Level)
kurtosis(dane$Expression_Level)
hist(dane$P_value,
     main = "Rozkład wartości P_value",
     xlab = "P_value",
     ylab = "Częstość",
     col = "lightblue",
     border = "black",
     breaks = 20)

hist(dane$Log2FC,
     main = "Rozkład wartości Log2FC",
     xlab = "Log2 fold change",
     ylab = "Częstość",
     col = "lightgreen",
     border = "black",
     breaks = 20)
top_down <- dane[order(dane$Log2FC), ]
top_down_10 <- head(top_down, 10)
print(top_down_10)

top_up <- dane[order(-dane$Log2FC), ]
top_up_10 <- head(top_up, 10)
print(top_up_10)


