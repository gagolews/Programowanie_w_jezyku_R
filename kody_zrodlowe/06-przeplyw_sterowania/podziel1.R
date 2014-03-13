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
## podziel1.R
## Podzial wektora liczbowego wzgledem czesci calkowitej elementow
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



# Na marginesie, ponizsze implementacje zakladaja, ze oficjalnie
# nie znamy jeszcze czynnikow - w przecinym przypadku mozna uzyc
# cut(), table(), a nawet split().
# Pozbawiloby to nas jednak dobrej zabawy. :-)



# Funkcja dla danego wektora liczbowego x (argument wejsciowy)
# zwraca (dane wyjsciowe) liste wektorow liczbowych skladajaca sie
# z obserwacji z x podzielonych na klasy wg nastepujacego algorytmu.
# Niech [a,b), a,b - calkowite, bedzie najmniejszym przedzialem takim,
# ze x_i nalezy do [a,b) dla kazdego i.
# j_ty element listy wyjsciowej, j=1,2,...,b-a jest wektorem skladajacym sie
# ze wszystkich elementow x_i takich, ze x_i nalezy do [a+j-1,a+j).
#
# Rozwiazanie podstawowe (calkiem niezle, gdy jest malo klas)
# Wada: dla kazdej klasy "przegladamy" za kazdym razem caly wektor
# Pesymistyczna zlozonosc obliczeniowa: pozornie O(n+k), a naprawde O(kn)
# gdzie k==b-a, n==length(x)
podziel1a <- function(x)
{
   stopifnot(is.numeric(x) && length(x) > 0 && all(is.finite(x)))
   minmax <- range(x)
   a <- floor(minmax[1])
   b <- floor(minmax[2])+1

   klasy <- vector("list", b-a) # prealokacja wynikowej listy
   for (j in seq_along(klasy))
      klasy[[j]] <- x[floor(x) == a+j-1]

   klasy
}



# Rozwiazanie drugie, dosc naiwne
# Wada: "dynamiczne" rozszerzanie wektora przy kazdej aktualizacji
# Pesymistyczna zlozonosc obliczeniowa: pozornie O(n+k), a naprawde O(n^2+k)
podziel1b <- function(x)
{
   stopifnot(is.numeric(x) && length(x) > 0 && all(is.finite(x)))
   minmax <- range(x)
   a <- floor(minmax[1])
   b <- floor(minmax[2])+1

   klasy <- vector("list", b-a) # prealokacja wynikowej listy

   ktore <- floor(x)-a+1
   for (i in seq_along(x))
   {
      m <- length(klasy[[ktore[i]]])+1 # indeks, pod ktory dodajemy element
      klasy[[ktore[i]]][m] <- x[i]    # dynamiczne rozszerzanie wektorow! :-(
   }

   # wektor klasy w tym momencie nie spelnia jeszcze podanych zalozen
   # - niektore elementy moga byc rowne NULL (ktore?), a powinny byc numeric(0)
   for (j in seq_along(klasy)) klasy[[j]] <- as.numeric(klasy[[j]])

   klasy
}


# Rozwiazanie trzecie
# Wada: wbrew "KISS" == Keep it simple, duzo petli R-owych
# takze duzo (za duzo) wolnych petli R-a
# Pesymistyczna zlozonosc obliczeniowa: O(n+k) => "Teoretycznie" idealne
podziel1c <- function(x)
{
   stopifnot(is.numeric(x) && length(x) > 0 && all(is.finite(x)))
   minmax <- range(x)
   a <- floor(minmax[1])
   b <- floor(minmax[2])+1

   klasy <- vector("list", b-a) # prealokacja wynikowej listy
   ktore <- floor(x)-a+1 # nr klasy 1..(b-a) dla kazdego elementu x

#    stopifnot(all(range(ktore) == c(1, b-a))) # asercja - na wszelki wypadek

   # zlicz, jak dlugie musza byc wektory w wynikowej liscie:
   ile <- numeric(length(klasy)) # b-a zer
   for (i in seq_along(x))     ile[ktore[i]] <- ile[ktore[i]]+1
   for (j in seq_along(klasy)) klasy[[j]] <- numeric(ile[j]) # prealokacja

   nast <- numeric(length(klasy)) # b-a zer - ostatnie indeksy
   for (i in seq_along(x))
   {
      nast[ktore[i]] <- nast[ktore[i]] + 1
#       stopifnot(nast[ktore[i]] <= ile[ktore[i]]) # asercja
      klasy[[ktore[i]]][nast[ktore[i]]] <- x[i]
   }

   klasy
}





# # Przyklad:
# x <- c(-1, -1.1, 2, 2.99, 3, 0, 0.1, 0.2, 0.3)
# podziel1a(x)
# podziel1b(x)
# podziel1c(x)



# ---------------- Test poprawnosci (przykladowy) -------------------

# # Najpierw sprawdzmy, czy implementacje sa poprawne:
# x <- rcauchy(1000, 0, 10)
# pa <- podziel1a(x)
# pb <- podziel1b(x)
# pc <- podziel1c(x)
# stopifnot(identical(pa, pb))
# stopifnot(identical(pa, pc))

# ----------------- Porownanie wydajnosci ---------------------------

# "Ladnie" zestawia czas dzialania podanych funkcji na danym wektorze
# x - wektor liczbowy (dane)
# nazwax - nazwa zbioru danych
# funkcje - lista funkcji (nazwana) do przetestowania na x
raport.czas <- function(x, nazwax, funkcje) {
   cat("Dane:", format(nazwax, width=5), "; ")
   cat("n =", format(length(x), width=8), "; ")
   cat("k =", format(diff(floor(range(x)))+1, width=8), "\n")

   for (fi in seq_along(funkcje)) {
      cat(names(funkcje)[fi], ": ", sep="")
      # czas mierzymy 3 razy, zwracamy sume user+system time:
      czasy <- replicate(3, sum(system.time(funkcje[[fi]](x))[1:2]))
      # pokazujemy mediane z 3 pomiarow:
      cat("user+system time =", format(median(czasy), nsmall=3, width=11))
      cat("\n")
   }

   cat("\n\n")
}



set.seed(12345) # ustalmy ziarno generatora liczb pseudolosowych
# => zawsze te same wyniki dla rnorm() i rinnych()


dane <- list(
   x1=rnorm  (300000, 0, 10), # duzo elementow, niewiele klas
   x2=rcauchy( 15000, 0, 1),  # wiele klas, nierownomierne rozlozenie
   x3=runif  (100000, 0, 1)   # 1 klasa
)

for (i in seq_along(dane)) {
   raport.czas(dane[[i]], names(dane)[i],
         list(podziel1a=podziel1a,
              podziel1b=podziel1b,
              podziel1c=podziel1c))
}


## Przykladowe wyniki na komputerze autora:
##
## Dane: x1    ; n =   300000 ; k =      102
## podziel1a: user+system time =       0.976
## podziel1b: user+system time =      10.553
## podziel1c: user+system time =       4.641
##
##
## Dane: x2    ; n =    15000 ; k =    45377
## podziel1a: user+system time =      20.458
## podziel1b: user+system time =       0.329
## podziel1c: user+system time =       0.428
##
##
## Dane: x3    ; n =   100000 ; k =        1
## podziel1a: user+system time =       0.005
## podziel1b: user+system time =      18.917
## podziel1c: user+system time =       1.531
##
##
## Wnioski:
## 1. petle R-owe dzialaja naprawde wolno
## 2. teoretyczna zlozonosc obliczeniowa niekoniecznie przeklada sie wprost
##    na czas obliczen
## 3. najlepsze rozwiazanie (z powyzszych)
##    - kombinacja wersji a i c (adaptacyjnie ---
##    "male" k => wybierz a, "duze" k => wybierz c)
##    Na marginesie - gdyby nam naprawde zalezalo (jesliby ta operacja
##    bylaby krytyczna w jakims algorytmie - implementujemy w C)


## Ciekawostka - prekompilacja kodu R-a (zob. rozdz. XXX)
library("compiler") # install.packages("compiler"), jesli nie ma
podziel1aP <- cmpfun(podziel1a)
podziel1bP <- cmpfun(podziel1b)
podziel1cP <- cmpfun(podziel1c)

for (i in seq_along(dane)) {
   raport.czas(dane[[i]], names(dane)[i],
               list(podziel1aP=podziel1aP,
                    podziel1bP=podziel1bP,
                    podziel1cP=podziel1cP))
}


## Wyniki:
##
## Dane: x1    ; n =   300000 ; k =      102
## podziel1aP: user+system time =       1.035
## podziel1bP: user+system time =       9.196
## podziel1cP: user+system time =       1.202
##
##
## Dane: x2    ; n =    15000 ; k =    45377
## podziel1aP: user+system time =      21.292
## podziel1bP: user+system time =       0.118
## podziel1cP: user+system time =       0.133
##
##
## Dane: x3    ; n =   100000 ; k =        1
## podziel1aP: user+system time =       0.005
## podziel1bP: user+system time =      16.536
## podziel1cP: user+system time =       0.360
##
##
## Wniosek pozostawiamy Czytelnikowi. :-)
