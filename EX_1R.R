A <- c(1, 4, 6, 8, 10)
B <- c(-1.7, 2.5, -3.5, 4.5, -5.5)
C <- factor(c("ssDNA", "dsDNA", "RNA", "Proteins", "Lipids"))
      levels = c("ssDNA", "dsDNA", "RNA", "Proteins", "LIpids")
C
levels(C) 
levels(C) <- c("RNA","ssDNA", "dsDNA","Proteins", "LIpids" )
D <- c(TRUE, FALSE, FALSE, FALSE, TRUE)
wynik1 <- A + B
wynik2 <- A - B
A + B
A - B
A * B
A / B
nchar(C)
C[3]
C[c(1,4)]
sort(C)
sort(C, decreasing = TRUE)
sum(D)
which(D)
!D

