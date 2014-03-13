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
## selsort.R
## Sortowanie przez wybor
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


# Implementacja I
selsort1 <- function(x) {
   stopifnot(is.numeric(x))
   n <- length(x)
   if (n <= 1)
      return(x) # inaczej ponizsza petla nie bedzie dzialac prawidlowo
   for (i in 1:(n-1)) {
      m <- i # szukamy indeksu najmniejszego elementu z x[i:n]...
      for (j in (i+1):n)
         if (x[j] < x[m])
            m <- j # znalezlismy mniejszy
      x[c(i,m)] <- x[c(m,i)] # zamien x[m] z x[i]
   }
   x
}


# Implementacja II
selsort2 <- function(x) {
   stopifnot(is.numeric(x))
   n <- length(x)
   if (n <= 1)
      return(x)
   for (i in 1:(n-1)) {
      m <- which.min(x[i:n])+i-1
      x[c(i,m)] <- x[c(m,i)]
   }
   x
}
