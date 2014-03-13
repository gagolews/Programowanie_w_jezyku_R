## Copyright (c) 2013-2014, Marek Gagolewski (http://www.mini.pw.edu.pl/~gagolews)
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
## jpeg.R
## Ladowanie, zapisywanie i wyswietlanie bitmap w formacje JPEG
##
## Ostatnia aktualizacja: marzec 2014
##
## Dziękuję Maciejowi Bartoszukowi za erraty do poniższych funkcji.
##
## ----------------------------------------------------------------------------



# Wymaga pakietu jpeg - jesli nie zainstalowany, wywolaj
# install.packages("jpeg")
library("jpeg")


# Wyswietla bitmape <img> na ekranie
# Bitmapa w skali szarosci reprezentowana jest przez macierz
# o wartosciach z [0,1]
# Bitmapa w modelu RGB  reprezentowana jest przez tablice
# o wartosciach z [0,1], III wymiar odpowiada kolejno kanalom R, G i B
rysuj <- function(img) {
   stopifnot(is.numeric(img))
   stopifnot(length(dim(img)) == 2 || length(dim(img)) == 3)
   stopifnot(all(img >=0 & img <= 1))

   if (length(dim(img)) == 2) # Skala szarosci -> konwersja do RGB
      img <- array(img, dim=c(dim(img),3))

   stopifnot(dim(img)[3] == 3)

   wys <- nrow(img)
   szer <- ncol(img)



   # Inicjalizacja okna graficznego
   oldmar <- par(mar=rep(0,4)) # margines wewnetrzny - brak
   oldoma <- par(oma=rep(0,4)) # margines zewnetrzny - brak
   on.exit(par(mar=oldmar))    # przywroc ustawienia po zakonczeniu
   on.exit(par(oma=oldoma), add=TRUE) # jw.
   plot(NA, xlim=c(1,szer), ylim=c(1,wys), ann=FALSE, axes=FALSE) # utworz pusty rysunek


   # Wyswietlenie bitmapy
   rasterImage(img,1,1,szer,wys)
}


# Wczytuje bitmape z pliku <filename>
# uzywajac funkcji readJPEG() z pakietu `jpeg'
# Wynik: tablica o wartosciach z [0,1],
# III wymiar odpowiada kolejno kanalom R, G i B
wczytajJPEG_RGB <- function(filename) {
   if (!any(loadedNamespaces()=="jpeg")) stop("Zaladuj pakiet `jpeg'!")
   readJPEG(filename)
}


# Wczytuje bitmape z pliku <filename>
# uzywajac funkcji readJPEG() z pakietu `jpeg'
# i konwertuje ja do skali szarosci
# Wynik: macierz o wartosciach z [0,1]
wczytajJPEG_szary <- function(filename) {
   if (!any(loadedNamespaces()=="jpeg")) stop("Zaladuj pakiet `jpeg'!")
   img <- readJPEG(filename)
   # Konwertuj RGB do skali szarosci
   0.2126*img[,,1] + 0.7152*img[,,2] + 0.0722*img[,,3]
}


# Zapisuje bitmape <img> do pliku <filename>
# korzystajac z funkcji writeJPEG() z pakietu `jpeg'
# Parametr <quality> okresla stopien kompresji (0-maksymalny, 1-minimalny)
# Bitmapa w skali szarosci reprezentowana jest przez macierz
# o wartosciach z [0,1]
# Bitmapa w modelu RGB  reprezentowana jest przez tablice
# o wartosciach z [0,1], III wymiar odpowiada kolejno kanalom R, G i B
zapiszJPEG <- function(img, filename, quality=0.85) {
   stopifnot(is.numeric(img))
   stopifnot(length(dim(img)) == 2 || length(dim(img)) == 3)
   stopifnot(all(img >=0 & img <= 1))

   if (length(dim(img)) == 2) # Skala szarosci -> konwersja do RGB
      img <- array(img, dim=c(dim(img),3))

   stopifnot(dim(img)[3] == 3)

   writeJPEG(img, filename, quality)
}

