gene_expression <- matrix(
  rnorm(20, mean=10, sd=2),
  nrow = 4,  
  ncol = 5,  
  dimnames = list(
    c("Gen_A", "Gen_B", "Gen_C", "Gen_D"),
    c("Próbka_1", "Próbka_2", "Próbka_3", "Próbka_4", "Próbka_5")
  )
)
print(gene_expression)
print(apply(gene_expression, 1, mean))
print("Średnia dla każdego wiersza")
odchylenie <- apply(gene_expression[, c("Próbka_1", "Próbka_2", "Próbka_3", "Próbka_4", "Próbka_5")], 2, sd, na.rm = TRUE)
print(odchylenie)
max_wynik <- apply(gene_expression[, c("Próbka_1", "Próbka_2", "Próbka_3", "Próbka_4", "Próbka_5")], 1, max, na.rm = TRUE)
print(max_wynik)
wynik <- apply(gene_expression[, c("Próbka_1", "Próbka_2", "Próbka_3", "Próbka_4", "Próbka_5")], 2, function(x) sum(x > 10, na.rm = TRUE))
print(wynik)
