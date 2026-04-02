library(stringr)
dane <- read.delim("C:/Users/kacpe/Downloads/sekwencje.txt", header = TRUE, sep = "\t")
print(dane)
str_count(dane$Sekwencja, "ATG")
str_replace_all(dane$Sekwencja, "U", "T")
sekwencja_dna <- dane$Sekwencja
sekwencja_dna[dane$Typ == "RNA"] <- gsub("U", "T", sekwencja_dna[dane$Typ == "RNA"])
print(sekwencja_dna)
print(dane)
str_sub(dane$Sekwencja, 1, 10)
Pierwsze_10 <- substring(dane$Sekwencja, 1, 10)
print(Pierwsze_10)
str_detect(dane$Sekwencja, "GAG")
print(dane)
dane$Sekwencja_rev <- dane$Sekwencja
dane$Sekwencja_rev[dane$Typ == "DNA"] <- chartr("ATGC", "TACG",dane$Sekwencja[dane$Typ == "DNA"])
dane$Sekwencja_rev[dane$Typ == "RNA"] <- chartr("AUGC", "UACG",dane$Sekwencja[dane$Typ == "RNA"])
print(dane)
tabela <- data.frame(
  ID = dane$ID,
  Pierwsze_10 = substr(dane$Sekwencja, 1, 10),
  Ostatnie_5 = substr(dane$Sekwencja, nchar(dane$Sekwencja)-4, nchar(dane$Sekwencja)),
  Motyw_GaG = str_detect(dane$Sekwencja, "GAG")
  )
print(tabela)