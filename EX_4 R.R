df <- data.frame(
  ID = 1:5,
  Wiek = c(25, 34, 28, 52, 40),
  Płeć = c("Kobieta", "Mężczyzna", "Kobieta", "Mężczyzna", "Kobieta"),
  Wzrost = c(165, 180, 170, 175, 168),
  Waga = c(60, 80, 65, 75, 58),
  Status_zdrowia = c("Dobry", "Średni", "Dobry", "Zły", "Dobry")
)

print(df)
str(df)
head(df, n=3)
mean(df$Wiek)
filtered_data <-df[df$Płeć == "Kobieta" & df$Status_zdrowia == "Dobry", ]
print(filtered_data)
sorted_data <- df[order(df$Wiek, decreasing = TRUE), ]
print(sorted_data)
filtered_data1 <- max(df$Wzrost)
filtered_data2 <- min(df$Wzrost)
print(filtered_data1)
print(filtered_data2)