library(dplyr)
dane <- read.csv("C:/Users/kacpe/Downloads/rna_seq_data.csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 stringsAsFactors = FALSE,
                 na.strings = c("NA", "")
)
print(dane)
geny_up_significant <- dane %>%
  filter(P_value < 0.05)
print(geny_up_significant)
gene_select_types <- geny_up_significant %>%
  filter(Sample_Quality == "high")
print(gene_select_types)
gene_col <- gene_select_types %>% 
  select(Gene_Symbol, Expression_Level, Log2FC, Gene_Type)
print(gene_col)
gene_grouped <- gene_col %>%
  group_by(Gene_Type)
print(gene_grouped)
gene_srednia <- gene_col %>%
  group_by(Gene_Type) %>%
  summarise(
    srednia_expression = mean(Expression_Level, na.rm = TRUE)
  )
print(gene_srednia)
Nowa_kolumna <- gene_col %>%
  group_by(Gene_Type) %>%
  mutate(liczba_genow = n())
print(Nowa_kolumna)
gene_wg_ekspresji <- gene_srednia %>%
  arrange(desc(srednia_expression))
print(gene_wg_ekspresji)
