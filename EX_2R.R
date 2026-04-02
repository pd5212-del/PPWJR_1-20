Ekspresja <- matrix(runif(12, 1, 10), nrow= 3, ncol=4)
rownames(Ekspresja) <- c("Gen1", "Gem2", "Gen3")
colnames(Ekspresja) <- c("Próbka1", "Próbka2", "Próbka3", "Próbka4")
print(Ekspresja)
element <- Ekspresja[1,4]
print(element)
row <- Ekspresja[3, ]
column <- Ekspresja[ ,2]
print(row)
print(column)
m <- Ekspresja
rowMeans(m)
d <- Ekspresja
colMeans(d)
Ekspresja1 <- t(Ekspresja)
print(Ekspresja1)
nowa_macierz <- m[, c("Próbka1", "Próbka3")]
print(nowa_macierz)
