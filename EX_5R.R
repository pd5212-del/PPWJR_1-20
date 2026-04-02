dane <- read.csv(
  "C:/Users/kacpe/Downloads/pacjenci.csv", 
  header = TRUE,
  sep = ",",
  dec = ".",
  stringsAsFactors = FALSE
)
str(dane)
head(dane)
dim(dane)
dane$NewColumn <- c("W")
print(dane)

write.csv(dane, "pacjenci.csv", row.names = FALSE)

library(openxlsx)
dane1 <- read.xlsx("C:/Users/kacpe/Downloads/geny.xlsx", sheet = 1)
head(dane1)
str(dane1)
dim(dane1)
dane1$NewColumn <- c("W")
print(dane1)

library(openxlsx)
write.xlsx(dane1, "geny.xlsx")

dane2 <- read.delim("C:/Users/kacpe/Downloads/sekwencje.txt", sep= "\t")
head(dane2)
str(dane2)
dim(dane2)
dane2$NewColumn <- c("W")
print(dane2)
write.csv(dane, "sekwencje.txt", sep ="\t", row.names = FALSE)

library(XML)
dane3 <- xmlParse("C:/Users/kacpe/Downloads/bialka.xml")
print(dane3)


url <- "https://raw.githubusercontent.com/jamovi/r-datasets/master/data/DNase.csv"
dane4 <- read.csv(url)
print(dane4)

library(biomaRt)
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
dane5 <- getBM(
  attributes = c(
    "ensembl_gene_id",
    "hgnc_symbol",
    "chromosome_name",
    "start_position",
    "end_position",
    "gene_biotype"
  ),
  filters = "hgnc_symbol",
  values = "MT-CO1",
  mart = ensembl
)
print(dane5)