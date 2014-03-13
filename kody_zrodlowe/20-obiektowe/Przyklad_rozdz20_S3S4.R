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


## Serdecznie dziękuję Annie Cenie za istotny wkład w poniższe.


okrag <- function(x0, y0, r) {
  stopifnot(is.numeric(x0), is.numeric(y0), is.numeric(r))
  stopifnot(is.finite(x0), is.finite(y0), r>0)
  stopifnot(length(x0) == 1, length(y0) == 1, length(r) == 1)
  structure(list(x0=x0, y0=y0, r=r), class=c("okrag"))
}
wielokat <- function(x, y) {
  stopifnot(is.numeric(x), is.numeric(y))
  stopifnot(is.finite(x), is.finite(y))
  stopifnot(length(x) == length(y))
  structure(list(x=x, y=y), class=c("wielokat"))
}

trojkat <- function(x0, y0, x1, y1, x2, y2) {
  w <- wielokat(c(x0, x1, x2), c(y0, y1, y2))
  stopifnot(length(w$x) == 3)
  class(w) <- c("trojkat", class(w))
  w
}

# print() ma jeden argument i „...”
print.okrag <- function(w, ...) {
  cat(sprintf("Okrag o środku [%g,%g] i promieniu %g\n" ,
              w$x0, w$y0, w$r))
}
print.wielokat <- function(w, ...) {
  cat(sprintf("%d-kat\n" , length(w$x)))
}

print(okrag(1,2,3))
trojkat(0,0,1,0,0,1)

# argumentu „y” nie używamy - możemy nadać mu wartość doplot.wielokat <- function(w, y=NULL, ...) {
plot.wielokat<-function(w,y=NULL,...){
# ...sprawdzanie poprawności argumentu „w”...
  polygon(w$x, w$y, ...)
}

plot.okrag <- function(w, y=NULL, ...) {
  # ...sprawdzanie poprawności argumentu „w”...
  theta <- seq(0, 2*pi, length.out=100)[-1]
  plot(wielokat(w$x0 + w$r*cos(theta),
                w$y0 + w$r*sin(theta)), ...)
}

plot.new()
plot.window(c(0,1),c(0,1))
plot(okrag(0.5,0.5,0.3),col="red")

library("methods")

setClass("Wielokat",representation=list(x="numeric" , y="numeric"))
showClass("Wielokat")
getSlots("Wielokat")

w1 <- new("Wielokat" , x=c(1, 2, 3), y=c(1, 1, 2))
class(w1) # to samo dla attr(w1, ’class’)
## [1] "Wielokat"
## attr(,"package")
## [1] ".GlobalEnv"
typeof(w1)
## [1] "S4"
mode(w1)
## [1] "S4"
isS4(w1) # jest to obiekt jakiejś klasy typu S4
## [1] TRUE
is.object(w1) # jest to jakiś obiekt
## [1] TRUE

print(w1)
slotNames(w1)
w1@x

setValidity("Wielokat" , function(object) {
  if (!all(is.finite(object@x)) || !all(is.finite(object@y)))
    return("’oczekiwano wartości skończonych’")
  if (length(object@x) != length(object@y))
    return("’wektory różnej długości’")
  if (length(object@x) < 3)
    return("’oczekiwano >= 3 wierzchołków’")
  TRUE # wszystko OK
})

validObject(w1)

setClass("Trojkat" ,
         contains="Wielokat" , # dziedziczy wszystkie pola
         validity=function(object) { # określ. war. popr. w miejscu
           if (length(object@x) != 3)
             return("należy podać 3 wierzchołki" )
           TRUE
         }
)
t1 <- new("Trojkat" , x=c(1,2,3), y=c(1,1,3))
class(t1) # jedna klasa - nie jak w S3
## [1] ".GlobalEnv"
is(t1, "Wielokat" ) # a jednak...
## [1] TRUE
new("Trojkat" , x=c(1,2,3,4), y=c(1,1,3,3))
## Error: invalid class "Trojkatóbject: należy podać 3 wierzchołki
new("Trojkat" , x=c(1,2,3), y=c(1,2)) # „dziedziczenie” war. popr
## Error: invalid class "Trojkatóbject: wektory różnej długości


test <- function(x) {
  print("metoda domyślna")
}
setGeneric("test" )
## [1] "test"
test
## standardGeneric for "test" defined from package ".GlobalEnv"
##
## function (x)
## standardGeneric("test")
## <environment: 0x48500a0>
## Methods may be defined for arguments: x
## Use showMethods("test") for currently available ones.
typeof(test) # nowy typ podstawowy
## [1] "closure"
class(test)
## [1] "standardGeneric"
## attr(,"package")
## [1] "methods"
body(test) # ciało funkcji test()
## standardGeneric("test")
getGeneric("test") # podstawowe informacje
## standardGeneric for "test" defined from package ".GlobalEnv"
##
## function (x)
## standardGeneric("test")
## <environment: 0x48500a0>
## Methods may be defined for arguments: x
## Use showMethods("test") for currently available ones.

setMethod("show" ,
          signature=c(object="Wielokat"),
          function(object) { # nazwa arg. musi się zgadzać z nazwą z funkcji generycznej
            validObject(object) # sprawdź poprawność
            cat(sprintf("’To jest %d-kat o wierzchołkach: ’" , length(object@x)))
            cat(sprintf("(%g, %g)" , object@x, object@y))
            cat("\n" )
          }
)
## [1] "show"
print(new("Wielokat" , x=c(1,2,3), y=c(1,1,3)))

setMethod("as.list" ,
          signature=c(x="Wielokat" ),
          function(x, ...) {
            validObject(x)
            list(x=x@x, y=x@y)
          }
)
## [1] "as.list"
as.list(new("Wielokat", x=c(1,2,3), y=c(1,1,3))) # zob. też setAs()

setGeneric("translacja" , function(w, delta) w+delta)
## [1] "translacja"
translacja(1:5, 0.1) # metoda domyślna
## [1] 1.1 2.1 3.1 4.1 5.1
setMethod("translacja" ,
          signature=c(w="Wielokat" , delta="numeric" ),
          function(w, delta) {
            validObject(w)
            new("Wielokat" , x=w@x + delta, y=w@y + delta)
          }
)

translacja(new("Wielokat" , x=c(1,2,3), y=c(1,1,3)), 0.1)

attr(translacja, "default")

translacja
showMethods("translacja")
