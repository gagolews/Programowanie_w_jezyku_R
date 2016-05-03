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
## system.time.compare.R
## Wielokrotny pomiar czasu za pomoca funkcji system.time()
## Umozliwia porownywanie czasow dzialania kilku wyrazen na raz
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



## Wejscie: wyrazenia R-a
## Wyjscie: ramka danych - wyniki pomiaru czasu wykonania podanych wyrazen
system.time.compare <- function(..., .ntrials=100) {
   # wyrazenia do obliczenia:
   expr <- match.call()[-1]
   n <- length(expr)
   if (n == 0) stop('no expressions to be benchmarked')

   # etykiety:
   labels <- names(expr)
   if (is.null(labels)) labels <- as.character(expr)

   # tu przechowywac bedziemy wyniki:
   results <- data.frame(time=rep(NA, n),
                         relative=rep(NA, n),
                         row.names=labels)

   .frame   <- force(parent.frame())

   for (i in 1:n) {
      # kazde wyrazenie jest obliczane .ntrials razy
      # interesuje nas mediana z sumy 'user' i 'system time'
      .timings <- replicate(.ntrials,
         system.time(eval(expr[[i]], envir=.frame), TRUE)
      )
      results$time[i] <- median(.timings[1,]+.timings[2,])
   }


   results$relative <- results$time/min(results$time)
   results
}



# # test - pierwiastkowanie
# print(system.time.compare(
#    for (i in 1:10000) sqrt(i),
#    for (i in 1:10000) i^0.5
# ))
#
# print(system.time.compare(
#    test1=for (i in 1:10000) sqrt(i),
#    test2=for (i in 1:10000) i^0.5
# ))
