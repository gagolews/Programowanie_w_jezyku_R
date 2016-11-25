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
## demo-color-names.R
## Demonstracja wygladu barw nazwanych
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


kk <- 20 # liczba kolorow na kolumne
cex.label <- 0.6 # skalowanie rozmiaru czcionki - ustaw, by bylo ladnie


# ustaw marginesy na zero:
par(mar=rep(0,4))
par(oma=rep(0,4))
par(yaxs="i") # nie dopuszczamy na powiekszenie wsp. y uzytkownika o 4%
par(xaxs="i") # nie dopuszczamy na powiekszenie wsp. x uzytkownika o 4%


n <- length(colors()) # ile kolorow?

# inicjuj rysunek:
plot.new()
plot.window(c(0,kk), c(0, ceiling(n / kk)))

w <- 1 # aktualny wiersz
k <- 1 # aktualna kolumna
for (i in 1:n) {
   rect(k-1, w-1, k, w, border=NA, col=colors()[i]) # prostokat
   text(k-0.5, w-0.5, i, # tekst w prostokacie - nr indeksu (i)
      cex=cex.label, # cex wplywa na rozmiar czcionki
      col=ifelse(sum(col2rgb(colors()[i]))>255*1.5, 1, 0) # kontrastujacy kolor
        # 1 - czarny, 0 - bialy, oczywiscie (przy domyslnej palette())
   )

   # aktualizuj aktualna kolumne i ewentualnie wiersz
   k <- k+1
   if (k > kk) {
      k <- 1
      w <- w+1
   }
}
