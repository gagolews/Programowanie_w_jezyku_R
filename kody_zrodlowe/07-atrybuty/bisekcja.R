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
## bisekcja.R
## Znajdywanie miejsca zerowego funkcji jednej zmiennej metoda bisekcji
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------





# Znajdywanie miejsca zerowego funkcji jednej zmiennej metoda bisekcji
# Argumenty wejsciowe:
# f - funkcja jednej zmiennej (wektor liczbowy o dlugosci 1)
#     zwracajaca wektor liczbowy o dlugosci 1
# a, b - wektory liczbowe o dlugosci 1, a < b, f(a)*f(b) < 1
# eps - dokladnosc oszacowania (wykorzystane w warunku stopu algorytmu)
# maxiter - maksymalna liczba iteracji; wektor liczbowy o dlugosci 1;
#     jezeli maxiter jest rzeczywisty, to obcinamy czesc ulamkowa
# wynik: jak w uniroot(), tzn. 4-elementowa lista o polach nazwanych:
#     root (przyblizone polozenie miejsca zerowego), f.root (wartosc funkcji
#     tamze), iter (liczba wykonanych iteracji), estim.prec (blad oszacowania)
bisekcja <- function(f, a, b, eps=1e-16, maxiter=100)
{
   stopifnot(is.function(f))
   stopifnot(is.numeric(a) && length(a) == 1 && is.finite(a))
   stopifnot(is.numeric(b) && length(b) == 1 && is.finite(b))
   stopifnot(is.numeric(maxiter) && length(maxiter) == 1 && is.finite(maxiter))
   stopifnot(is.numeric(eps) && length(eps) == 1 && is.finite(eps))
   stopifnot(a < b && eps > 0 && maxiter >= 1)
   maxiter <- as.integer(maxiter) # chcemy miec wartosc calkowita
   stopifnot(f(a)*f(b) < 0) # na podstawie tw. Darboux

   for (i in 1:maxiter) {
      x <- (a+b)*0.5 # srodek przedzialu [a,b]
      if (abs(f(x)) < eps) break # warunek stopu
      if (f(a)*f(x) > 0) a <- x else b <- x
   }

   if (i == maxiter) warning("Osiagnieto maksymalna liczbe iteracji")

   list(
      root=x,
      f.root=f(x),
      iter=i,
      estim.prec=(b-a)*0.5
   )
}


# Przykladowe wywolania:
# bisekcja(sin, -1, 1.1, eps=1e-16)
# bisekcja(sin, -1, 1.1, eps=1e-17)
# bisekcja(sin, -1, 1.1, eps=1e-23)
# bisekcja(sin, -1, 1.1, eps=1e-40, maxiter=10000)
# bisekcja(sin, -1, 1.1, eps=1e-300, maxiter=1000000)
