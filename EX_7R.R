dane <- read.csv("pacjenci.csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 stringsAsFactors = FALSE,
                 na.strings = c("NA", "")
)
print(dane)
print(is.na(dane))
na_counts <- sum(is.na(dane))
print(na_counts)
library(naniar)
vis_miss(dane)
dane_bez_na <- na.omit(dane)
print(dane_bez_na)
dane$Hemoglobina[is.na(dane$Hemoglobina) & dane$Płeć == "K"] <- mean(dane$Hemoglobina[dane$Płeć == "K"], na.rm = TRUE)
dane$Hemoglobina[is.na(dane$Hemoglobina) & dane$Płeć == "M"] <- mean(dane$Hemoglobina[dane$Płeć == "M"], na.rm = TRUE)
print(dane$Hemoglobina)
print(dane)
dane$Leukocyty[is.na(dane$Leukocyty)] <- median(dane$Leukocyty, na.rm = TRUE)
print(dane$Leukocyty)
print(dane)
dane$Płytki_krwi[is.na(dane$Płytki_krwi) & dane$Płeć == "K"] <- mean(dane$Płytki_krwi[dane$Płeć == "K"], na.rm = TRUE)
dane$Płytki_krwi[is.na(dane$Płytki_krwi) & dane$Płeć == "M"] <- mean(dane$Płytki_krwi[dane$Płeć == "M"], na.rm = TRUE)
print(dane$Płytki_krwi)
print(dane)
najczestszy_Stan <- names(sort(table(dane$Stan), decreasing = TRUE))[1]
dane$Stan[is.na(dane$Stan)] <- najczestszy_Stan
print(dane$Stan)
print(dane)
dane$Palenie[is.na(dane$Palenie)] <- "Brak danych"
print(dane$Palenie)
print(dane)
