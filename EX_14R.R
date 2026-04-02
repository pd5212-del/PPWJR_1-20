dane <- read.csv("C:/Users/kacpe/Downloads/rna_seq_data (1).csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 stringsAsFactors = FALSE,
                 na.strings = c("NA", "")
)
print(dane)

jpeg("histogram_ekspresji.jpeg", width = 800, height = 600)
hist(dane$Expression_Level,
     main = "Rozkład poziomów ekspresji genów",
     xlab = "Poziom ekspresjii",
     ylab = "Częstość",
     col = "green",
     border = "white")

dev.off()
jpeg("zmiana_ekspresji.jpeg", width = 800, height = 600)
plot(dane$Log2FC, -log10(dane$P_value),
     main = "Zmiana ekspresji vs istotność statystyczna",
     xlab = "Log2 fold change",
     ylab = "-log10(p-value)",
     pch = 21,
     col = ifelse(dane$Adjusted_P_value < 0.05, "red", "blue")
     )
dev.off()



