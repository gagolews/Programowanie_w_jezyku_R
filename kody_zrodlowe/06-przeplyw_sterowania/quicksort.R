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
## quicksort.R
## Sortowanie szybkie (Quick sort)
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



# Sortowanie szybkie podanego wektora
# (algorytm rekurencyjny korzystajacy z piekna R-a
#  - najprostsza implementacja - O(n^2) dla wektorow juz posortowanych)
# Wejscie: wektor atomowy
# Wyjscie: wektor atomowy posortowany niemalejaco
quicksort <- function(x)
{
   stopifnot(is.vector(x) && is.atomic(x))
   if (length(x) == 0) x
   else c(quicksort(x[x<x[1]]), x[x==x[1]], quicksort(x[x>x[1]]))
}


# Przykladowe wywolania:
# quicksort(1:10)
# quicksort(10:1)
# quicksort(c("Ania", "Ola", "Monika", "Asia",
#            "Sylwia", "Ala", "Kasia"))
# Na marginesie: dla dlugich, posortowanych wektorow
# R zglasi blad: Error: evaluation nested too deeply: infinite recursion?




# Sortowanie szybkie podanego wektora #2
# (wersja z pseudolosowym wyborem elementu dzielacego)
# Wejscie: wektor atomowy
# Wyjscie: wektor atomowy posortowany niemalejaco
quicksort2 <- function(x)
{
   stopifnot(is.vector(x) && is.atomic(x))
   if (length(x) == 0) return(x)

   k <- sample(1:length(x), 1) # losowy wybor elementu dzielacego
   c(quicksort(x[x<x[k]]), x[x==x[k]], quicksort(x[x>x[k]]))
}



# Sortowanie szybkie podanego wektora #3
# (wersja z pseudolosowym wyborem elementu dzielacego
# i korzystajaca z funkcji split() - por. rozdz. nt. czynników - tutaj bez
# znaczacego wplywu na wydajnosc)
# Wejscie: wektor atomowy
# Wyjscie: wektor atomowy posortowany niemalejaco
quicksort3 <- function(x)
{
   stopifnot(is.vector(x) && is.atomic(x))
   if (length(x) == 0) return(x)

   k <- sample(1:length(x), 1)
   y <- sign(x - x[k]) # -1, 0 lub 1 - 3 klasy
   podzial <- split(x, y) # zwraca liste 3 wektorow
   c(quicksort(podzial[[1]]), podzial[[2]], quicksort(podzial[[3]]))
}
