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
## box-plot.R
## Przykladowa implementacja funkcji rysujacej wykres skrzynkowy
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


## Funkcja rysujaca poziomy wykres skrzynkowy
## (ang. box and whisker plot), por. boxplot.default()
##
## Argumenty wejściowe:
##    x          - wektor obserwacji - liczbowy o dlugosci > 0,
##                 zawierajacy tylko wartosci "skonczone";
##    hpudelko   - wzgledna wysokosc pudelka,
##                 wartosc liczbowa z przedzialu (0,1);
##    odstajace  - okresla, jakie wartosci sa wartosciami ostajacymi;
##                 y jest obserwacja odstajaca, jesli y nie nalezy do
##                 przedzialu (Q1-odstajace*IQR, Q3+idstajace*IQR);
##                 wartosc liczbowa dodatnia, domyslnie 1.5;
##                 podaj Inf, jesli nie chcesz oznaczac wartosci odstajacych;
##    pch        - sposob oznaczania obserwacji odstajacych na rysunku (?par)
##
## Wartość zwracana: --- (por. jednak ?boxplot)
myboxplot <- function(x, hpudelko=0.6, odstajace=1.5, pch=0)
{
   ## --------------- sprawdzenie poprawnosci argumentow ------------------
   stopifnot(is.numeric(x), length(x) > 0, all(is.finite(x)))

   stopifnot(is.numeric(hpudelko), length(hpudelko) == 1)
   stopifnot(hpudelko > 0, hpudelko < 1)

   stopifnot(is.numeric(odstajace) && length(odstajace) == 1 && odstajace > 0)

   # pch nie sprawdzamy, bo zrobi to za nas funkcja points()
   # ----------------------------------------------------------------------

   # kwantyle probkowe: min, max, Q1, Q3, med(iana)
   qx <- quantile(x, c(0, 1, 0.25, 0.75, 0.5), names=FALSE)
   names(qx) <- c("min", "max", "Q1", "Q3", "med") # dla czytelnosci kodu

   iqr <- diff(qx[c("Q1", "Q3")]) # rozstep miedzykwartylowy

   # znajdz indeksy obserwacji ostajacych:
   obsodst <- which((x < qx["Q1"]-odstajace*iqr) | (x > qx["Q3"]+odstajace*iqr))

   # wyznacz poczatki "wasow":
   wasy <- if (length(obsodst) > 0) range(x[-obsodst]) else range(x)

   # tworzenie nowego rysunku i inicjowanie uklaru wspolrzednych
   plot.new()
   plot.window(qx[c("min", "max")], c(-1, 1))


   # pudelko od Q1 do Q3:
   rect(qx["Q1"], -hpudelko, qx["Q3"], hpudelko)

   # oznacz mediane:
   lines(rep(qx[c("med")],2), c(-1,1)*hpudelko, lwd=3)

   # rysuj obserwacje odstajace; jest length(obsodst) == 0,
   # to ponizsza linijka nic nie robi (sprawdzilismy!)
   points(x[obsodst], rep(0, length(obsodst)), pch=pch)

   # rysuj wasy (na podstawie wektora wasy oraz Q1 i Q3 - do granic pudelka)
   lines(rep(wasy[1],2), c(-0.5,0.5)*hpudelko) # lewy was - pionowo
   lines(rep(wasy[2],2), c(-0.5,0.5)*hpudelko) # prawy was - pionowo
   lines(c(wasy[1],qx["Q1"],NA,qx["Q3"],wasy[2]),
         rep(0, 5)) # lewy i prawy - poziomo
   # na marginesie: drugi argument nie musi byc postaci c(0, 0, NA, 0, 0)
   # "If a point contains NA in either its x or y value it is omitted...."

   # os X
   # ....

   invisible(NULL) # wartosc zwracana - "nic ciekawego"
}


## Przyklad:
set.seed(1234) # jedno ziarno ==> zawsze ten sam ciag
x <- -rexp(200, 10.4)
myboxplot(x)
