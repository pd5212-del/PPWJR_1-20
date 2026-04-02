library(ggplot2)
dane <- read.csv("C:/Users/kacpe/Downloads/rna_seq_data (1).csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 stringsAsFactors = FALSE
)
print(dane)
jpeg("ekspresja_boxplot.jpeg", width = 1200, height = 800, quality = 100)

ggplot(dane, aes(x = Condition, y = Expression_Level, fill = Chromosome)) +
  geom_boxplot() +
  labs(
    title = "Poziomy ekspresji genów w różnych warunkach",
    x = "Warunek",
    y = "Poziom ekspresji"
  ) +
  theme_minimal()
print(wykres)

dev.off()
jpeg("volcano_plot.jpg", width = 1200, height = 800, quality = 100)
dane$istotnosc <- ifelse(dane$Adjusted_P_value < 0.05 & abs(dane$Log2FC) > 1,
                         "istotne",
                         "nieistotne")
wykres <- ggplot(dane, aes(x = Log2FC, y = -log10(P_value), color = istotnosc)) +
  geom_point(size = 2, alpha = 0.8) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Analiza różnicowej ekspresji genów",
    x = "Log2 fold change",
    y = "-log10(p-value)",
    color = "Klasyfikacja"
  ) +
  scale_color_manual(values = c("nieistotne" = "darkblue", "istotne" = "darkgreen")) +
  theme_minimal()

print(wykres)
dev.off()

table(dane$Gene_Type)
table(dane$Chromosome, dane$Condition)

istotne <- dane[dane$P_value < 0.05, ]
mean(abs(istotne$Log2FC), na.rm = TRUE)
head(istotne[order(-abs(istotne$Log2FC)), ], 5)
head(istotne[order(abs(istotne$Log2FC)), ], 5)
write.table(dane, "significant_genes_stats.txt", sep = "\t", row.names = FALSE)
