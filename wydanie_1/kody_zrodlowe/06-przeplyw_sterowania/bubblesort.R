## Copyright (c) 2013, Marek Gagolewski (http://rksiazka.rexamine.com)
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
## bubblesort.R
## Sortowanie babelkowe
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



# Uruchomienie calego skryptu w RStudio:
# wcisnij <CTRL+SHIFT+S> badz <CTRL+SHIFT+ENTER>


bubblesort <- function(x) {
   stopifnot(is.numeric(x), length(x) > 0)

   i <- length(x) # ostatni nieposortowany element
   j <- 1         # zaczynamy przegladanie od poczatku
   while (i > 1) {                                 # petla 1
      cat("--- i=", i, " x=", x, " ---\n", sep="") # ulatwimy sledzenie wykonania
      while (j < i) {                              # petla 2
         j <- j+1
         cat("porownuje x[", j-1, "]=", x[j-1], sep="")
         cat(" z x[",j,"]=", x[j], "\n", sep="")
         if (x[j] >= x[j-1])
            next                    # dot. petli 2 - dobre ustawienie - nic nie rob

         # zamien x[j] z x[j-1]:
         cat("zamieniam! przed: ", x, "\n", sep="")
         x[c(j-1,j)] <- x[c(j,j-1)] # sprytne - zamiana za pomoca jednej instrukcji
         cat("              po: ", x, "\n", sep="")
      }
      i <- i-1 # kolejny element juz na swoim miejscu
      j <- 1   # w kolejnej iteracji przegladamy od poczatku
   }
   x
}


# przyklad:
# bubblesort(c(5,3,4,2,1))
