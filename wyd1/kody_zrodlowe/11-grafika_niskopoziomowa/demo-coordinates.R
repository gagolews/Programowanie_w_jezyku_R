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
## demo-coordinates.R
## Wspolrzedne ukladu uzytkownika
##
## Ostatnia aktualizacja: marzec 2014
##
## ----------------------------------------------------------------------------



graphics.off() # reset wszystkiego


par(omi=c(0.2,0.35,0.2,0.35))
par(mai=c(0.25,0.4,0.25,0.4))
par(cex=0.833)

plot.new()
plot.window(c(-1,1), c(100,120))
box(which="plot",lty=4)
box(which="figure", lty=2)
box(which="outer", lty=1, lwd=2)

mtext("Margines wewnetrzny", 3, outer=FALSE, cex=0.75, col=2)
mtext("Margines zewnetrzny", 3, outer=TRUE, cex=0.75, col=4)
text(mean(par("usr")[1:2]), mean(par("usr")[3:4]), "Obszar rysowania", col="darkgreen")

points(par("usr")[1],
       par("usr")[3],
       xpd=NA, pch=19)
text(  par("usr")[1]+0.1*diff(par("usr")[c(1,2)]),
       par("usr")[3]+0.1*diff(par("usr")[c(3,4)]),
       "par(\"usr\")[1], par(\"usr\")[3]", xpd=NA, pos=4, offset=0.1)
arrows(par("usr")[1],
       par("usr")[3],
       par("usr")[1]+0.1*diff(par("usr")[c(1,2)]),
       par("usr")[3]+0.1*diff(par("usr")[c(3,4)]),
       code=1, length=0.15, angle=20, xpd=NA)


points(par("usr")[1]-xinch(par("mai")[2]),
       par("usr")[3]-yinch(par("mai")[1]),
       xpd=NA, pch=19)
text(  par("usr")[1]+0.1*diff(par("usr")[c(1,2)]),
       par("usr")[3]+0.2*diff(par("usr")[c(3,4)]),
       "jn.-xinch(par(\"mai\")[2]), jn.-yinch(par(\"mai\")[1]", xpd=NA, pos=4, offset=0.1)
arrows(par("usr")[1]-xinch(par("mai")[2]),
       par("usr")[3]-yinch(par("mai")[1]),
       par("usr")[1]+0.1*diff(par("usr")[c(1,2)]),
       par("usr")[3]+0.2*diff(par("usr")[c(3,4)]),
       code=1, length=0.15, angle=20, xpd=NA)

points(par("usr")[1]-xinch(par("mai")[2])-xinch(par("omi")[2]),
       par("usr")[3]-yinch(par("mai")[1])-yinch(par("omi")[1]),
       xpd=NA, pch=19)
text(  par("usr")[1]+0.1*diff(par("usr")[c(1,2)]),
       par("usr")[3]+0.3*diff(par("usr")[c(3,4)]),
       "jn.-xinch(par(\"omi\")[2]), jn.-yinch(par(\"omi\")[1]", xpd=NA, pos=4, offset=0.1)
arrows(par("usr")[1]-xinch(par("mai")[2])-xinch(par("omi")[2]),
       par("usr")[3]-yinch(par("mai")[1])-yinch(par("omi")[1]),
       par("usr")[1]+0.1*diff(par("usr")[c(1,2)]),
       par("usr")[3]+0.3*diff(par("usr")[c(3,4)]),
       code=1, length=0.15, angle=20, xpd=NA)

points(par("usr")[2],
       par("usr")[4],
       xpd=NA, pch=19)
text(  par("usr")[2]-0.1*diff(par("usr")[c(1,2)]),
       par("usr")[4]-0.1*diff(par("usr")[c(3,4)]),
       "par(\"usr\")[2], par(\"usr\")[4]", xpd=NA, pos=2, offset=0.1)
arrows(par("usr")[2],
       par("usr")[4],
       par("usr")[2]-0.1*diff(par("usr")[c(1,2)]),
       par("usr")[4]-0.1*diff(par("usr")[c(3,4)]),
       code=1, length=0.15, angle=20, xpd=NA)


points(par("usr")[2]+xinch(par("mai")[4]),
       par("usr")[4]+yinch(par("mai")[3]),
       xpd=NA, pch=19)
text(  par("usr")[2]-0.1*diff(par("usr")[c(1,2)]),
       par("usr")[4]-0.2*diff(par("usr")[c(3,4)]),
       "jw.+xinch(par(\"mai\")[4]), jw.+yinch(par(\"mai\")[3]", xpd=NA, pos=2, offset=0.1)
arrows(par("usr")[2]+xinch(par("mai")[4]),
       par("usr")[4]+yinch(par("mai")[3]),
       par("usr")[2]-0.1*diff(par("usr")[c(1,2)]),
       par("usr")[4]-0.2*diff(par("usr")[c(3,4)]),
       code=1, length=0.15, angle=20, xpd=NA)


points(par("usr")[2]+xinch(par("mai")[4])+xinch(par("omi")[4]),
       par("usr")[4]+yinch(par("mai")[3])+yinch(par("omi")[3]),
       xpd=NA, pch=19)
text(  par("usr")[2]-0.1*diff(par("usr")[c(1,2)]),
       par("usr")[4]-0.3*diff(par("usr")[c(3,4)]),
       "jw.+xinch(par(\"omi\")[4]), jw.+yinch(par(\"omi\")[3]", xpd=NA, pos=2, offset=0.1)
arrows(par("usr")[2]+xinch(par("mai")[4])+xinch(par("omi")[4]),
       par("usr")[4]+yinch(par("mai")[3])+yinch(par("omi")[3]),
       par("usr")[2]-0.1*diff(par("usr")[c(1,2)]),
       par("usr")[4]-0.3*diff(par("usr")[c(3,4)]),
       code=1, length=0.15, angle=20, xpd=NA)
