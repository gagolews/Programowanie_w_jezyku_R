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
## str_match_all_perl.R
## Odpowiednik str_match_all z pakietu stringr, ale dziala takze dla PCRE
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------


## Uwaga: w czasie pisania tej książki nie był jeszcze dostępny na CRAN
## pakiet stringi (zob. http://stringi.rexamine.com).
## Pakiet ten rozwiązuje większość problemów związanych z przetwarzaniem
## napisów w R, które zostały przedstawione w rozdziale 9.
## Zamiast więc poniższej funkcji, zachęcam do używania
## stri_match_all_regex().


#' Wydobywanie podnapisow pasujacych do danych wyrazen
#' regularnych (z mozliwymi podgrupami)
#' Argumenty:
#' s - napisy, w ktorych wyszukujemy (dopasowanie w UTF-8)
#' p - napis - wyrazenie regularne
#' Wyjscie:
#' lista macierzy
str_match_all_perl <- function(s, p) {
   library("stringr")
   stopifnot(is.character(s), is.character(p), length(p) == 1)
   out <- vector("list", length(s))
   nna <- which(!is.na(s))
   m <- gregexpr(enc2utf8(p), enc2utf8(s[nna]), perl=TRUE)
   for (j in seq_along(m)) {
      if (any(m[[j]] < 0)) next # brak dopasowania

      nmatch <- length(m[[j]])
      ncapt  <- ncol(attr(m[[j]], "capture.start"))

      out[[j]] <- matrix(str_sub(s[nna[j]], m[[j]],
         m[[j]]+attr(m[[j]], "match.length")-1),
         nrow=nmatch, ncol=ncapt+1)

      if (ncapt > 0) {
         cs <- as.integer(attr(m[[j]], "capture.start"))
         cl <- as.integer(attr(m[[j]], "capture.length"))
         out[[j]][,-1] <- str_sub(s[nna[j]], cs, cs+cl-1)
      }
   }
   out
}


str_match_all_perl(
   c('zupa=rosol, drugie=kurcze, deser=lody', 'a=b', 'xxx', NA),
   '(\\p{L}+)=(\\p{L}+)')

