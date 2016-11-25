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
## kwantyle.R
## Funkcja wyznaczajaca probkowe kwanyle zadanych rzedow
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



# Funkcja wyznaczajaca kwanyle probkowe zadanych rzedow
#
# Argumenty:
# x - wektor liczbowy niepusty, jezeli zawiera NA i nieskonczone, to blad
# p - wektor liczbowy niepusty - rzedy kwantyli
#
# Wartosc zwracana: wektor liczbowy o dlugosci |p| zawierajacy
# kwantyle probkowe zadanych rzedow.
# Jesli p_i nie jest z [0,1], to wynik_i jest NA.
kwantyle <- function(x, p)
{
   stopifnot(is.numeric(x) && length(x) > 0 && all(is.finite(x)))
   stopifnot(is.numeric(p) && length(p) > 0)

   wynik <- numeric(length(p)) # prealokacja wektora wynikowego

   x <- sort(x)
   n <- length(x)

   wynik[!is.finite(p) | p < 0 | p > 1] <- NA # niepoprawne p_i
   wynik[is.finite(p) & p==1] <- x[n] # maksimum dla p == 1 (oddzielny przypadek)

   indeksy_reszta <- is.finite(p) & p >=0 & p < 1
   h <-  (n - 1) * p[indeksy_reszta] + 1 # > 0
   wynik[indeksy_reszta] <- x[h]+(h-floor(h))*(x[h+1]-x[h])

   wynik # wartosc zwracana
}

# Przykladowe wywolania:
# kwantyle(1:10, 0)
# kwantyle(1:10, 1)
# kwantyle(1:10, c(0,0.5,1))
# kwantyle(1:10, mean)
# kwantyle(c(1,NA),1)
# kwantyle(print, mean)
# kwantyle(1:10, c(-1, 0, 0.5, NA, 1, 1.5, Inf))
