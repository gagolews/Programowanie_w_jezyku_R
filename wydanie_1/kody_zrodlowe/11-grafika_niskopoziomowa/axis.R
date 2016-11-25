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
## axis.R
## Przykladowa implementacja funkcji rysujacej osie ukladu wspolrzednych
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


## Funkcja rysujaca osie ukladu wspolrzednych
##
## Argumenty wejściowe:
##    xc, yc     - okresla srodek ukladu wspolrzednych
##    cex.axis   - wielkosc uzytej czcionki
##    ...        - dodatkowe parametry przekazywane do funkcji text()
##    axis.col, axis.lty - sposob rysowania osi
##    axis.tick  - wzledna (ulamek wysokosci/szerokosci obszaru rysowania)
##                 dlugosc znacznikow osi
## Wartość zwracana: ---
myaxis <- function(xc=0, yc=0, ..., axis.col=1, axis.lty=1, axis.tick=0.01)
{
   stopifnot(is.numeric(xc), length(xc) == 1)
   stopifnot(is.numeric(yc), length(yc) == 1)
   # pozostale parametry sprawdzane przez text() i lines()


   xt <- axTicks(1) # automatyczne generowanie ,,ladnych'' etykiet, por. także ?axis (dalej)
   lines(range(xt), rep(yc,2), col=axis.col, lty=axis.lty) # oś; można też spróbować z arrows()

   # małe znaczniki
   znx <- as.double(rbind(xt, xt, NA))
   zny <- rep(c(yc+c(-1,1)*axis.tick*diff(par("usr")[3:4]), NA), length(xt))
   lines(znx, zny, col=axis.col, lty=axis.lty)
   text(xt, rep(yc, length(xt)), format(xt), pos=1, xpd=TRUE, ...) # etykiety
   # format() zapewnia spójne formatowanie etykiet
   text(max(xt), yc, "x", pos=4, xpd=TRUE, xpd=TRUE, ...) # dodaj nazwę osi

   # OY:
   yt <- axTicks(2)
   lines(rep(xc,2), range(yt), col=axis.col, lty=axis.lty)
   zny <- as.double(rbind(yt, yt, NA))
   znx <- rep(c(xc+c(-1,1)*axis.tick*diff(par("usr")[1:2]), NA), length(yt))
   lines(znx, zny, col=axis.col, lty=axis.lty)
   text(rep(xc, length(yt)), yt, format(yt), pos=2, xpd=TRUE, ...)
   text(xc, max(yt), "y", pos=3, xpd=TRUE, xpd=TRUE, ...)

   invisible(NULL) # wartosc zwracana - "nic ciekawego"
}


## Przyklad:
# x <- seq(0,4*pi,length=100)
# y <- sin(x)
# par(mar=rep(2,4))
# plot(x, y, type='l', axes=FALSE, ann=FALSE)
# myaxis(2*pi, 0, col="darkgray", family="mono", cex=0.83, axis.col="gray")
