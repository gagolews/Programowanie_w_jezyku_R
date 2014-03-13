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
## plot-regions-1.R
## Demonstracja podzialu strony na obszary w pakiecie graphics - jeden rysunek
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------




graphics.off() # reset wszystkiego

# pdf("plot-regions-1.pdf", width=10/2.54, height=10/2.54,
#     pointsize=9, colormodel="cmyk")


par(oma=c(2,2,2,2)) # marginesy zewnetrzne - domyslnie rep(0,4)
par(bg="darkgray")  # kolor tla strony
# marginesy rysunku zostawiamy domyslne, czyli:
print(par()["mar"])

plot.new() # nowy rysunek
plot.window(c(-1,1), c(-1,1)) # ustaw wspolrzedne uzytkownika

# ?par: Note that the coordinate ranges will be extended by 4%
# if the appropriate graphical parameter xaxs or yaxs
# has value "s" (which is the default).
print(par("usr")) # podaj wspolrzedne uzytkownika, rzeczywiscie rozszerzone

# rysujemy wypelnione kolorem prostokaty, wystarczajaco duze, by zostaly uciete
par(xpd=TRUE) # rysowanie takze po marginesach rysunku
rect(-10,-10,10,10, col="white") # bialy prostokat
par(xpd=FALSE) # rysowanie tylko po wlasciwym obszarze rysowania (domyslnie)
rect(-10,-10,10,10, col="gray") # szary prostokat

axis(1, col="darkgray", col.axis="gray") # os pozioma - na dole
axis(2, col="darkgray", col.axis="gray") # os pionowa - po lewej

box("plot", lty="dashed")   # obwodka wlasciwego obszaru rysowania
box("figure", lty="solid")  # obwodka obszaru rysunku


# mtext() wyswietla tekst na marginesach
# marginesy wewnetrzne rysunku:
mtext("Inner margin 1", side=1, outer=FALSE) # dol
mtext("Inner margin 2", side=2, outer=FALSE) # lewo
mtext("Inner margin 3", side=3, outer=FALSE) # gora
mtext("Inner margin 4", side=4, outer=FALSE) # prawo

# wyswietl tekst na srodku wlasciwego obszaru rysowania:
text(0, 0, "Plot region")


# marginesy zewnetrzne strony:
mtext("Outer margin 1", side=1, outer=TRUE) # dol
mtext("Outer margin 2", side=2, outer=TRUE) # lewo
mtext("Outer margin 3", side=3, outer=TRUE) # gora
mtext("Outer margin 4", side=4, outer=TRUE) # prawo

box("outer", lty="dotdash") # obwodka strony


# dev.off()
