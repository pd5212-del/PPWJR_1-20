library(openxlsx)
dane <- read.xlsx("C:/Users/kacpe/Downloads/geny.xlsx", sheet = 1)
print(dane)
print("analiza_ekspresji:")
print("analiza_ekspresji:")
analiza_ekspresji <- function(df, prog_fc = 0.8, prog_p = 0.05) {
  kolumny <- c("Gene_ID", "Symbol", "Kontrola_1", "Kontrola_2", "Kontrola_3",
                        "Próba_1", "Próba_2", "Próba_3")
  if (!all(kolumny %in% names(df))) {
    stop("Kolumny nie istnieją")
  }
  print("Wszystkie kolumny istnieją")
  geny_up <- df[df[["Log2FC"]] > prog_fc & df[[ "P_value"]] < prog_p, c("Symbol", "Log2FC", "P_value")]
  geny_down <- df[df[["Log2FC"]] < -prog_fc & df[[ "P_value"]] < prog_p, c("Symbol", "Log2FC", "P_value")]

  Kontrole <- c("Kontrola_1", "Kontrola_2", "Kontrola_3")
  Próby <- c("Próba_1", "Próba_2", "Próba_3")
  średnia_kontrole <- rowMeans(dane[, Kontrole], na.rm = TRUE)
  średnia_próba <- rowMeans(dane[, Próby], na.rm = TRUE)
  return(list(
    liczba_genow_nadekspresjonowanych = nrow(geny_up),
    liczba_genow_obnizonych = nrow(geny_down),
    geny_nadekspresjonowane = geny_up,
    geny_obniżone = geny_down,
    Kontrole = Kontrole,
    Próby = Próby,
    średnia_kontrole = średnia_kontrole,
    średnia_próba = średnia_próba
  ))
}

wynik <-analiza_ekspresji(dane)
print(wynik$liczba_genow_nadekspresjonowanych)
print(wynik$liczba_genow_obnizonych)
print(wynik$geny_nadekspresjonowane)
print(wynik$geny_obniżone)
print(wynik$Kontrole)
print(wynik$Próby)
print(wynik$średnia_kontrole)
print(wynik$średnia_próba)