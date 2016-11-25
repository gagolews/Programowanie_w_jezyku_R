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
## demo-pch.R
## Demonstracja sposobu rysowania punktow
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



p <- 0   # pch pierwszego punktu
n <- 25  # liczba punktow ogolem
kk <- 5  # liczba punktow na kolumne
cex.label <- 0.6 # skalowanie rozmiaru czcionki - ustaw, by bylo ladnie


# ustaw marginesy na zero:
par(mar=rep(0,4))
par(oma=rep(0,4))



# inicjuj rysunek:
plot.new()
plot.window(c(0,kk), c(0, ceiling(n / kk)))


w <- 1 # aktualny wiersz
k <- 1 # aktualna kolumna
for (i in p:(p+n-1)) {
   points(k-0.5, w-0.25, pch=i) # punkt
   text(k-0.5, w-0.75, i, # tekst w prostokacie - nr indeksu (i)
        cex=cex.label, # cex wplywa na rozmiar czcionki
   )

   # aktualizuj aktualna kolumne i ewentualnie wiersz
   k <- k+1
   if (k > kk) {
      k <- 1
      w <- w+1
   }
}
