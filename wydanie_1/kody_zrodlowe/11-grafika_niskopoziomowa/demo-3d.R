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
## demo-3d.R
## Demonstracja sposobu rysowania obiektow 3D
## za pomoca ortogonalnego rzutu na ,,plaszczyzne ekranu''
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------





# #####################################################################
# ############# FUNKCJE POMOCNICZE ####################################
# #####################################################################

obrot <- function(punkty, kX, kY, kZ) {
   # macierz obrotu o katy Eulera (kX, kY, kZ)
   T <- matrix(c(
      cos(kY)*cos(kZ), -cos(kX)*sin(kZ)+sin(kX)*sin(kY)*cos(kZ),  sin(kX)*sin(kZ)+cos(kX)*sin(kY)*cos(kZ),
      cos(kY)*sin(kZ),  cos(kX)*sin(kZ)+sin(kX)*sin(kY)*sin(kZ), -sin(kX)*cos(kZ)+cos(kX)*sin(kY)*sin(kZ),
      -sin(kY),        sin(kX)*cos(kY),                          cos(kX)*cos(kY)
   ), byrow=TRUE, nrow=3)

   # dokonaj przeksztalcenia wspolrzednych wszystkich punktow
   # przez macierz transformacji T
   # y := Tx
   t(apply(punkty, 1, "%*%", t(T))) # transponujemy T, bo zmieniamy kolejnosc czynnikow
}


translacja <- function(punkty, tX, tY, tZ)
{
   t(apply(punkty, 1, "+", c(tX, tY, tZ)))
}


skalowanie <- function(punkty, sX, sY=sX, sZ=sY)
{
   t(apply(punkty, 1, "*", c(sX, sY, sZ)))
}


rzutowanie.ortogonalne <- function(punkty) {
   T <- matrix(c(1,0,0,
                 0,1,0,
                 0,0,0),
   nrow=3, byrow=TRUE)

   # dokonaj przeksztalcenia wspolrzednych wszystkich punktow
   # przez macierz transformacji T
   # y := Tx
   t(apply(punkty, 1, "%*%", t(T))) # transponujemy T, bo zmieniamy kolejnosc czynnikow
}



# #####################################################################
# ############# RYSOWANY OBIEKT #######################################
# #####################################################################


# wierzcholki obiektu do narysowania (szescian)
punkty <- matrix(
   c(0,0,0,
     1,0,0,
     1,1,0,
     0,1,0,
     0,0,1,
     1,0,1,
     1,1,1,
     0,1,1
   ), ncol=3, byrow=TRUE)

# kolejnosc rysowania krawedzi (indeksy punktow)
kolejnosc <- c(1,2,3,4,1,NA,5,6,7,8,5,NA,1,5,NA,2,6,NA,3,7,NA,4,8)




# #####################################################################
# ################### RYSOWANIE #######################################
# #####################################################################

par(mar=rep(0,4))
plot.new()
plot.window(c(0,1),c(0,1))

# przykladowe przeksztalcenia
p <- punkty
p <- obrot(p, pi/6, pi/4, pi/4)
p <- translacja(p, 0.3, 0.5, 0)
p <- skalowanie(p, 0.5)
p <- rzutowanie.ortogonalne(p) # rzutuj na 2D przed wyswietleniem
lines(p[kolejnosc,1], p[kolejnosc,2]) # 3 kolumne pomijamy
text(p[,1], p[,2], 1:nrow(p), col=rgb(1,0,0,0.5))
