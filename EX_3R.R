bio_lista <- list(
  sekwencje_DNA = c("ATGCCTGAC", "GTCAGTCAG", "CTGATCGATGCTA"),
  gatunki = c("Homo sapiens", "Mus musculus", "Drosophila melanogaster"),
  ekspresja_genow = matrix(runif(9, 0, 100), nrow = 3),
  cechy_morfologiczne = data.frame(
    Gatunek = c("Homo sapiens", "Mus musculus", "Drosophila melanogaster"),
    Wysokość = c(170, 10, 0.1),
    Waga = c(70, 0.02, 0.0002)
  ),
  mutacje = list(Homo_sapiens = c("BRCA1", "BRCA2"), Mus_musculus = "p53")
)
element_DNA <- bio_lista$sekwencje_DNA
element_gatunki <- bio_lista$gatunki
element_ekspresja <- bio_lista$ekspresja_genow
element_cechy <- bio_lista$cechy_morfologiczne
print(element_DNA)
print(element_gatunki)
print(element_ekspresja)
print(element_cechy)
nazwa_gatunku <- bio_lista$cechy_morfologiczne$Gatunek
print(nazwa_gatunku)
bio_lista$sekwencje_DNA <- c(bio_lista$sekwencje_DNA, "CGATGTAGCTA")
bio_lista$sekwencje_DNA
bio_lista$ekspresja_genow[1,1] <- 99.9
bio_lista$ekspresja_genow
mean(bio_lista$ekspresja_genow)
bio_lista$cechy_morfologiczne <- rbind(
  bio_lista$cechy_morfologiczne,
  data.frame(
    Gatunek = "Arabidopsis thaliana",
    Wysokość = 0.3,
    Waga = 0.001
  )
)
bio_lista$mutacje$Homo_sapiens
bio_lista$mutacje$Mus_musculus <- c(bio_lista$mutacje$Mus_musculus, "Lmna")
str(bio_lista)