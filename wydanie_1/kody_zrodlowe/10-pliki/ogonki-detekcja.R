## Copyright (c) 2013-2014, Marek Gagolewski (http://rksiazka.rexamine.com)
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are met:
##
## 1. Redistributions of source code must retain the above copyright notice,
##    this list of conditions and the following disclaimer.
## 2. Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in
##    the documentation and/or other materials provided with the distribution.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
## AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
## THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
## CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
## OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
## WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
## OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
## ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##
## ----------------------------------------------------------------------------
##
## ogonki-detekcja.R
## Autodetekcja kodowania plikow tekstowych w jezyku polskim
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


## Uwaga: w czasie pisania tej książki nie był jeszcze dostępny na CRAN
## pakiet stringi (zob. http://stringi.rexamine.com).
## Pakiet ten rozwiązuje większość problemów związanych z przetwarzaniem
## napisów w R, które zostały przedstawione w rozdziale 9.
## W wersji 0.1-25 stringów dostępne są eksperymentalne wersje funkcji
## służących do automatycznej detekcji kodowania,
## zob. stri_enc_detect() i stri_enc_detect2(),
## a także np. stri_enc_isutf8().


autodetekcja <- function(nazwy.plikow) {
   stopifnot(is.character(nazwy.plikow))
   wyniki <- vector("list", length(nazwy.plikow))

   for (i in seq_along(nazwy.plikow)) {

      nazwa.pliku <- nazwy.plikow[i]
      cat("\n------------------------------------------------------------\n")
      cat("Sciezka dostepu do pliku:", nazwa.pliku, "", sep="\n")

      # Najpierw ladujemy jako strumien bajtow
      # => kodowanie ogonkow calkowicie pomijane
      f <- file(nazwa.pliku, "r", raw=TRUE, encoding="")
      plik <- readLines(f, encoding="bytes")
      close(f)
      cat("Plik zostal zaladowany. Calkowita liczba wierszy: ",
         length(plik), ".\n\n", sep="")

      # Probujemy zgadnac kodowanie polskich ogonkow
      # Mila wlasnosc UTF-8: latwo wykryc, co z duzym prawdopodobienstwem
      # Unicodem nie jest. To samo dotyczy ASCII.
      # cztery proby: ASCII, UTF-8, windows-1250, iso8859-2

      # Kolejno: Aou, Si, Zi, aou, si, zi :-)
      # /aou, si - czesto wystepuja w tekscie/
      ogonki.iso <- c(161, 166, 172, 177, 182, 188)
      ogonki.win <- c(165, 140, 143, 185, 156, 159)
      plik.raw <- unlist(lapply(plik, charToRaw)) # ciag bajtow
      # czestosc wystepowania znakow
      plik.znaki <- table(factor(as.integer(plik.raw), levels=1:255))

   #    # mozesz obejrzec sobie wykres czestosci:
   #    par(ask=TRUE)
   #    barplot(plik.znaki+1, log="y")

      cat("Odgadywanie kodowania polskich znakow: ")
      kod.ASCII <- sum(plik.znaki[128:255]) # 0 => ASCII
      if (kod.ASCII == 0) {
         cat("ASCII, czyli brak ogonkow (na pewno)\n")
         plik <- iconv(plik, "ASCII", "")
      } else {
         # UTF-8
         plik.UTF8 <- iconv(plik, "UTF-8", "")
         kod.UTF8  <- sum(is.na(plik.UTF8)) # > 0 => na pewno nie UTF-8
                                          # == 0 => UTF-8 z duzym prawdopodob.
         if (kod.UTF8 == 0) {
            cat("UTF-8 (bardzo prawdopodobne)\n")
            plik <- plik.UTF8
         } else {
            kod.iso   <- sum(plik.znaki[ogonki.iso]) # duzo => raczej latin-2
            kod.win   <- sum(plik.znaki[ogonki.win]) # duzo => raczej cp-1250

            if (kod.iso > kod.win) {
               cat(sprintf("ISO-8859-2 (prawdopodobne; %d znakow latin2 vs %d znakow CP1250)\n",
                     kod.iso, kod.win))
               plik <- iconv(plik, "ISO-8859-2", "")
            }
            else  {
               cat(sprintf("WINDOWS-1250 (prawdopodobne; %d znakow latin2 vs %d znakow CP1250)\n",
                           kod.iso, kod.win))
               plik <- iconv(plik, "WINDOWS-1250", "")
            }
         }
      }
      wyniki[[i]] <- plik # zapisz przekodowana zawartosc pliku
   }
   wyniki
}




nazwy.plikow <- c(
   '00-dane/test-ascii.txt',
   '00-dane/test-cp1250.txt',
   '00-dane/test-latin2.txt',
   '00-dane/test-utf8.txt'
)
wyniki <- autodetekcja(nazwy.plikow)
nazwy.plikow <- basename(nazwy.plikow)

cat("\n------------------------------------------------------------\n")
cat("Czy zawartosc plikow po konwersji jest identyczna?\n")
cat("NB: Dla ASCII nie ma to sensu.\n")
test <- matrix(NA, nrow=length(wyniki), ncol=length(wyniki),
               dimnames=list(nazwy.plikow, nazwy.plikow))
for (i in 1:length(wyniki))
   for (j in i:length(wyniki))
      test[i,j] <- identical(wyniki[[i]], wyniki[[j]])
print(test)
