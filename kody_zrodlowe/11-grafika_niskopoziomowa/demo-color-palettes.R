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
## demo-color-palettes.R
## Demonstracja wygladu palet barw
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------





demo.colors <- function(colors) {

   # sprawdzanie poprawnosci parametrow wejsciowych:
   stopifnot(is.character(colors))
   n <- length(colors)
   stopifnot(n >= 1)

   # ustaw marginesy na rozsadne minimum
   par(mar=rep(0,4))
   par(oma=c(2,1,0,1))
   par(yaxs="i") # nie dopuszczamy na powiekszenie wsp. y uzytkownika o 4%

   # tworzymy rysunek:
   plot.new()
   plot.window(c(0.5,n+0.5), c(0,1))
   par(xaxp=c(1,n,1)) # kontroluj zakres etykiet na osi x
   axis(1)

   # rysujemy n prostokatow wypelnionych wszystkimi danymi kolorami:
   for (i in 1:n) {
      rect(i-0.5, 0, i+0.5, 1, border=NA, col=colors[i])
   }
}



graphics.off() # reset wszystkiego

# wywoluj po kolei, wiersz po wierszu (CTRL+ENTER w RStudio),
# ewentualnie ustaw par(ask=TRUE) -
# tryb interaktywny - zatrzymuje sie po kazdym rysowaniu

demo.colors(rainbow(10))
demo.colors(rainbow(100))
demo.colors(heat.colors(100))
demo.colors(cm.colors(100))
demo.colors(topo.colors(100))
demo.colors(gray.colors(100))



# jesli pakiet RColorBrewer nie jest zainstalowany,
# wywolaj install.packages("RColorBrewer")
library('RColorBrewer')

# mozesz wywolac takze display.brewer.all() (po graphics.off())

# przykladowe palety (zobacz wiecej: ?RColorBrewer)
# zwroc uwage na ograniczona maksymalna liczba kolorow:
demo.colors(brewer.pal(100, "Blues"))
demo.colors(brewer.pal(100, "PuBu"))
demo.colors(brewer.pal(100, "YlOrBr"))
demo.colors(brewer.pal(100, "BrBG"))
demo.colors(brewer.pal(100, "PuOr"))
demo.colors(brewer.pal(100, "RdYlGn"))
demo.colors(brewer.pal(100, "Spectral"))

demo.colors(brewer.pal(100, "Accent"))
demo.colors(brewer.pal(100, "Dark2"))
demo.colors(brewer.pal(100, "Paired"))
demo.colors(brewer.pal(100, "Pastel1"))
demo.colors(brewer.pal(100, "Pastel2"))
demo.colors(brewer.pal(100, "Set1"))
demo.colors(brewer.pal(100, "Set2"))
demo.colors(brewer.pal(100, "Set3"))
