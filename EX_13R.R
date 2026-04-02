symalacja_bakterii <- function(){
  bakterie <- 100
  max_godzin <- 10
  limit <- 100000
  godzina <- 0
  suma_wzrostu <- 0
  while (godzina < max_godzin && bakterie <= limit) {
    godzina <- godzina + 1 
    poprzednia_liczba <- bakterie
    bakterie <- bakterie * 2
    wzrost <- bakterie - poprzednia_liczba
    suma_wzrostu <- suma_wzrostu + wzrost
    print(paste("godzina:", godzina))
    print(paste("Liczba bakterii:", bakterie))
    print(paste("Wzrost o", wzrost, "bakterii od poprzedniej godziny"))
    print(" ")
    if (bakterie > limit) {
      break
    }
  }
  średni_wzrost <- suma_wzrostu / godzina
  print(" -----Podsumowanie -----")
  print(paste("Czas trwania:", godzina, "godzin"))
  print(paste("Końcowa liczba bakterii:", bakterie))
  print(paste("Średni wzrost na godzinę:", średni_wzrost))
}
symalacja_bakterii()