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
## system.time2.R
## Wielokrotny pomiar czasu za pomoca funkcji system.time()
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



## funkcja dziala identycznie jak system.time()
## z tym, ze wielokrotnie mierzy czas wykonania podanego wyrazenia
## i wybiera medianę z sumy 'user' i 'system time'
system.time2 <- function(expr, .ntrials=10) {
   .expr    <- substitute(expr)
   .frame   <- force(parent.frame())
   .timings <- replicate(.ntrials, system.time(eval(.expr,envir=.frame), TRUE))
   .ordidx  <- order(.timings[1,]+.timings[2,])
   .output <- .timings[,.ordidx[.ntrials/2]] # mediana
   class(.output) <- "proc_time"
   .output
}


# test - czas pierwiastkowania:
# print(system.time2({ for (i in 1:1000000) sqrt(i) }))
# print(system.time2({ for (i in 1:1000000) i^0.5   }))
