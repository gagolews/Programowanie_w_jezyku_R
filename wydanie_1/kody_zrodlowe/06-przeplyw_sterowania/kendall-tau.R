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
## kendall_tau.R
## Wyznaczanie wspolczynnika korelacji tau Kendalla
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


# Funkcja wyznaczajaca wartosc wspolczynnika tau Kendalla dla (x,y)
# Argumenty wejsciowe:
# x, y - niepuste wektory liczbowe o tej samej dlygosci
# Wartosc zwracana: wartosc wspolczynnika korelacji
tau <- function(x,y)
{
   stopifnot(is.numeric(x) && is.numeric(y))
   n <- length(x)
   stopifnot(n > 0 && length(y) == n) # niepuste wektory o tej samej dlugosci

   # wyznaczamy liczbe par zgodnych
   c <- 0
   for (i in 1:(n-1)) c <- c + sum((x[i]-x[(i+1):n])*(y[i]-y[(i+1):n]) > 0)
   # funkcja agregujaca sum() znacznie lepiej sie sprawuje tutaj
   # (szybciej, czytelniej) niz dodatkowa, druga jawna petla for

   4*c/(n*(n-1))-1 # wynik
}

# Przykladowe wywolania:
# tau(1:10, 10:1) # -1
# tau(1:10, 1:10) #  1
# tau(rnorm(1000), rnorm(1000)) # okolo 0



# Ciakawostka:
# Wersja alternatywna - z wykorzystaniem funkcji outer() - z rozdz. nt. macierzy
# Bardzo "pamieciozerna"!!!
# Okazuje sie, ze pierwotne tau() dziala szybciej
# Petli nie nalezy sie bac, ale staramy sie unikac, gdy istnieje
# rownowazne (pod wzgledem sposobu obliczenia), R-owe rozwiazanie
# w postaci funkcji w budowanej (ponizsze liczy sie za pomoca nieco
# innego algorytmu, choc wynik jest ten sam)
tau2 <- function(x,y)
{
   stopifnot(is.numeric(x) && is.numeric(y))
   n <- length(x)
   stopifnot(n > 0 && length(y) == n) # niepuste wektory o tej samej dlugosci

   xx <- outer(x, x, "-")
   yy <- outer(y, y, "-")
   c <- sum(xx*yy > 0)/2 # dzielimy przez 2, bo macierz jest symetryczna
   # => nie chcemy zliczac tych samych par dwa razy

   4*c/(n*(n-1))-1 # wynik
}

# Przyklad:
# x <- runif(2000)
# y <- runif(2000)
# system.time(tau(x,y))
# system.time(tau2(x,y))
