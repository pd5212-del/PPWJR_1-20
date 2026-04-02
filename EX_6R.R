library(openxlsx)
dane <- read.xlsx("C:/Users/kacpe/Downloads/geny.xlsx", sheet = "Metadane")
print(dane)
dane$Dlugosc_genu <- as.numeric(dane$End) - as.numeric(dane$Start)
print(dane)
dane$Kategoria_genu <- cut(dane$Dlugosc_genu,
                           breaks = c(0, 100000, 300000, Inf),
                           labels = c("Krótki", "Średni", "Długi"),
                           include.lowest = TRUE)
print(dane$Kategoria_genu)
print(class(dane$Kategoria_genu))
dane$Strand_binarny <- as.numeric(dane$Strand)
print(cbind(dane$Strand_binarny, dane$Strand))
dane$Data_odkrycia <- as.Date(
  c("1990.12.15", "1979.04.22", "1983.06.10", "1986.09.05",
    "2002.03.18", "1997.11.30", "1995.08.12", "1988.07.25"),
  format = "%Y.%m.%d"
)
print(dane$Data_odkrycia)
print(class(dane$Data_odkrycia))