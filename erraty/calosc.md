# Erraty i uwagi do rozdziału 0 #
## Przedmowa                   ##


-   **s. xiv, przypis 2**:

    *Liczba pakietów rośnie w tempie wykładniczym*
    => bardzo szybko => jakąkolwiek liczbę tu podamy i tak szybko przestanie
    być prawdziwa. Aktualną możemy poznać
    [na tej stronie](http://cran.rstudio.com/web/packages/index.html).

-   Na etapie korekty wkradło się do Przedmowy kilka niezbyt konsekwentnych
    ,,per Ty''. Proszę o wybaczenie.

# Erraty i uwagi do rozdziału 1    #
## Środowisko R i program RStudio ##


*   **s. 3, w. 1**:

    JEST: ~~*Język R powstał...*~~;

    POWINNO BYĆ: *Środowisko R powstało...*.

-   **s. 5, w. 2**:

    JEST: ~~*R jest dostępny na platformy Windows, Linux i MacOS*~~;

    POWINNO BYĆ: *R jest dostępny m.in. na platformy Windows, Linux i OS X*
    (R można używać np. także na różnych UNIXach).

-   **s. 5, w. 4**:

    Drobna uwaga: Polecam korzystanie z serwera lustrzanego `cran.rstudio.com`:
    Łączy się on automatycznie z najbliższym nam mirrorem z ,,chmury''.

-   **s. 8, p. 1.2.3**:

    JEST: ~~*w konsoli*~~;

    POWINNO BYĆ: *na konsoli*.


Kilka linków do stron pomocnych w nauce i doskonaleniu programowania w R
(zob. też ostatni rozdział książki):

* http://www.r-bloggers.com/
* http://stackoverflow.com/questions/tagged/r
* http://journal.r-project.org/
* http://www.rseek.org/
* http://www.rdocumentation.org/

# Erraty i uwagi do rozdziału 2 #
## Podstawowe typy atomowe     ##


-   **s. 23, w. -3**:

    Niepotrzebny nawias ,,`)`'' po `as.logical()`.

-   **s. 26, przyp. 7**:

    Przypis 7 w tym rozdziale jest tożsamy z przypisem 7 z rozdz. 1.
    Przypis ten powinien mieć brzmienie:
    *Choć jest to dozwolone, raczej nie powinniśmy używać
    polskich znaków diakrytycznych (ą, ś, ...) w nazwach syntaktycznych:
    tzw. ,,reszta świata'' może mieć z nimi problemy.*

-   **s. 27**:

    JEST: ~~*Utwórzmy zmienną o identyfikatorze x przechowującą wektor*~~;

    POWINNO BYĆ: *Utwórzmy obiekt związany z nazwą x przechowujący wektor*.

-   **s. 27**:

    JEST: ~~*w konsoli*~~;

    POWINNO BYĆ: *na konsoli*.

-   **s. 29**:

    Uwaga do ciekawostki: Tak samo lepiej nie używać nazwy `c` (dlaczego?).

    # Erraty i uwagi do rozdziału 3 #
## Operacje na wektorach       ##


-   **s. 37, w. -9**:

    JEST: ~~`x v y`~~;

    POWINNO BYĆ: **x** `v` **y** (pogrubienie)

-   **s. 47, w. -2**:

    JEST: ~~**f**(*x*)~~;

    POWINNO BYĆ: **f**(**x**) (pogrubienie)

-   **s. 52, tab. 3.9**:

    Drobna uwaga: wg terminologii z [30] funkcjami agregującymi
    w tab. 3.9 są tylko: mean, min, max, median, quantile.

-   **s. 59, w. 8.**:

    Drobna uwaga: `which.max(wektor.logiczny)`
    zwraca indeks pierwszego `TRUE`. Jeśli wektor zawiera tylko elementy `FALSE`,
    to zwracana jest wartość 1.

-   **s. 59, w. 13**:

    JEST: ~~*numery przedziału*~~;

    POWINNO BYĆ: *numery przedziałów*

# Erraty i uwagi do rozdziału 4 #
## Listy                       ##


-   **s. 62**:

    Wartą zanotowania funkcją jest ponadto `is.list()`.


-   **s. 63, ramka Informacja**:

    JEST: ~~*`NULL < logical < raw < integer < ...`*~~;

    POWINNO BYĆ: *`NULL < raw < logical < integer < ...`*,
    por. `c(TRUE, as.raw(0))` oraz `c(NULL, as.raw(0))`.

# Erraty i uwagi do rozdziału 5 #
## Funkcje                     ##


-   **s. 83**:

    JEST: ~~*serwera CRAN*~~;

    POWINNO BYĆ: *repozytorium CRAN*

-   **s. 91**:

    JEST: ~~*Argument specjalny `...`*~~;

    POWINNO BYĆ: *Parametr specjalny `...`*

# Erraty i uwagi do rozdziału 6      #
## Modyfikacja przepływu sterowania ##


-   **s. 100, w. -5**:

    JEST: ~~*wektorem jednoelementowym*~~;

    POWINNO BYĆ: *wektorem jednoelementowym lub pustym*

-   **s. 101, ciekawostka**:

    W Lispie dostępne jest *makro* `loop` (faktycznie nie jest ono
    wyrażeniem).

-   **rozdz. 6.2.1 (wielokrotnie)**:

    JEST: ~~`warunek`~~, ~~`wyrażenie`~~;

    POWINNO BYĆ: *`warunek`*, *`wyrażenie`* (krój maszynowy pochylony)

-   **rys. 6.4**:

    W druku zniknęła strzałka łącząca romb *`warunek`* (z lewej strony,
    obok `TRUE`) oraz prostokąt *`wyrażenie`*.


-   **s. 103, funkcja moja_sum() wersja 2**:

    Drobna uwaga:
    Warunek `stopifnot(is.logical(na.rm), length(na.rm) == 1, !is.na(na.rm))`
    można ewentualnie zastąpić `stopifnot(identical(na.rm, TRUE))`
    (choć nie jest to równoważny zapis, czasem używa się go w praktyce).

-   **s. 104, w. -14**:

    JEST: ~~*Oryginalna funkcja `any()` działa tak pięknie*~~;

    POWINNO BYĆ: *Oryginalna funkcja `any()` nie działa tak pięknie*

-   **s. 106, w. -9**:

    JEST: ~~*w której wyrażeniu się ono znajduje.*~~;

    POWINNO BYĆ: *w której `wyrażeniu` się ono znajduje.* (krój maszynowy pochylony)

# Erraty i uwagi do rozdziału 7      #
## Modyfikacja przepływu sterowania ##


-   **s. 126, w. -7**:

    Uwaga dot. autouzupełniania w przypadku operatora `$`
    (właściwie aktualnie dotyczy ramek danych w rozdz. 8):
    od R 3.1 częściowe uzupełnianie nazw kolumn generuje ostrzeżenie.

    W pliku [NEWS](http://cran.rstudio.com/src/base/NEWS.html)
    dla R 3.1.0 czytamy:

    > Partial matching when using the `$` operator on *data frames*
    > now throws a warning and may become defunct in the future.
    > If partial matching is intended, replace `foo$bar` by
    > `foo[["bar", exact = FALSE]]`.

# Erraty i uwagi do rozdziału 8  #
## Typy złożone                 ##



-   **s. 136, rozdz. 8.1**:

    *Macierze (...) są reprezentowane w R przez wektory __atomowe__ [podkr. wł.]
    z ustawionym atrybutem specjalnym `dim`*.
    Drobna uwaga: okazuje się, że nie tylko wektory atomowe
    mogą służyć za tzw. ,,bazę'' dla macierzy, ale też listy.
    Dlatego powyższe zdanie powinno brzmieć raczej *...są reprezentowane
    przez wektory z ustawionym atrybutem `dim`*.

    ```
    x <- list(1:2, 3:5, 6:9, 10:14)
    dim(x) <- c(2,2)
    x[[1,2]] # wydobywanie elementu
    x[1,2]   # podlista
    ```

-   **s. 144, w. 21**:

    Niepotrzebny nawias `)` po `2`

# Erraty i uwagi do rozdziału 9 #
## Przetwarzanie napisów       ##

**Uwaga ogólna**: w czasie pisania tej książki nie był jeszcze dostępny na CRAN
pakiet [stringi](http://stringi.rexamine.com).
Pakiet ten rozwiązuje większość problemów związanych z przetwarzaniem
napisów w R, które zostały przedstawione w rozdziale 9.
Tworzenie i zgłoszenie go na CRAN zajęło nam niestety prawie 1,5 roku
(ze względu m.in. na fakt, że wszystkie funkcje przetwarzające
napisy musieliśmy napisać od początku).
Gdyby nie to, rozdz. 9 wyglądałby teraz zupełnie inaczej...


-   **s. 169**:

    Drobna uwaga: *alfabet łaciński* - właść. podstawowy alfabet łaciński wg ISO
    (26 literowy, ISO basic Latin-script alphabet);
    klasyczny alfabet łaciński (ten od Łaciny) nie zawiera m.in.
    literki *w*.

-   **s. 172**:

    Ściślej: `enc2native()` jest odpowiednikiem `iconv(..., 'UTF-8', '')`
    wtedy, gdy podany jako pierwszy argument napis jest zakodowany w UTF-8

-   **s. 183, w. 6**:

    JEST: ~~*częścią ułamkową określoną z jawnie lub pominiętą*~~;

    POWINNO BYĆ: *z częścią ułamkową określoną jawnie lub pominiętą*.

-   **s. 184, w. 4**:

    JEST: ~~*wzorce nigdy nie nakładają się na siebie*~~;

    POWINNO BYĆ: *wykrywane są tylko rozłączne dopasowania wzorca*.

-   **s. 188, w. 5**:

    JEST: ~~*które są dopasowane do podnapisów*~~;

    POWINNO BYĆ: *które są dopasowywane do podnapisów*.

-   **s. 189, w. 18**:

    JEST: ~~`str_extract_all(enc2utf8('ĄąĆćĘęBb'), perl('[ą-ć]'))`~~;

    POWINNO BYĆ: `str_extract_all(enc2utf8('ĄąĆćĘęBb'), perl(enc2utf8('[ą-ć]')))`.

-   **s. 192, w. -4**:

    JEST: ~~*Drugie wywołanie usuwa...*~~;

    POWINNO BYĆ: *Trzecie wywołanie usuwa...*.

-   **s. 198n, rozdz. 9.4**:

    `CEST` oznacza *Central European Summer Time* (czas letni
    środkowoeuropejski)

    Mamy `CET == UTC+01:00` oraz `CEST == UTC+02:00`.

    Rozdział ten pisałem późną zimą, wiosna przyszła niezauważona...

# Erraty i uwagi do rozdziału 10 #
## Przetwarzanie plików         ##


-   **s. 208, ramka Informacja**:

    W RStudio możemy zmienić ustawienie domyślnego katalogu roboczego,
    por. Tools -> Global Options -> R -> Default working directory.

-   **s. 208, przypis 6**:

    W RStudio 0.98 wskazana opcja dostępna jest w menu Session
    -> Set Working Directory.

-   **s. 216, tab. 10.1**:

    Argumenty `quote` w tab. 10.1 powinny wyglądać następująco:
    `'\'"'`, `'"'`, `'"'`, `'"'`, `'"'`.

-   **s, 224, ramka Informacja**:

    *... lub `stri_wrap` z pakietu `stringi` ...* (dotyczy wersji >= 0.2 pakietu)

# Erraty i uwagi do rozdziału 11      #
## Niskopoziomowe operacje graficzne ##


-   **s. 239, ramka Informacja**:

    JEST: ~~*Są one ładowane automatycznie.*~~;

    POWINNO BYĆ: *Dwa pierwsze z nich są domyślnie automatycznie ładowane
    przy uruchomieniu R, por. p. 16.1.3.*

-   **s. 239, p. 11.2, w. 6**:

    JEST: ~~*są wspólne dla wszystkich systemów graficznych*~~;

    POWINNO BYĆ: *są uznawane przez funkcje z pakietu `graphics`*

-   **s.257, w. 1**:

    JEST: ~~*Każdy rysunek w R jest wykonywany przy użyciu...*~~;

    POWINNO BYĆ: *Każdy rysunek w R jest kreślony przy użyciu...*

-   **s. 258, przypis 14**:

    Nie jest tak zawsze (pliki mogą być skompresowane).
    Ta sama zasada dotyczy plików PDF.

-   **s.262, ramka Zadanie**:

    Po długiej "przerwie" pakiet `tikzDevice` wrócił na CRAN,
    możemy go więc zainstalować za pomocą "zwykłego" wywołania
    `install.packages()`.

# Erraty i uwagi do rozdziału 12       #
## Wysokopoziomowe operacje graficzne ##


-   **s. 265, w. -2**:

    JEST: ~~*opcji systemowej `scipen`*~~;

    POWINNO BYĆ: *opcji globalnej `scipen`*

# Erraty i uwagi do rozdziału 13           #
## Generowanie raportów przy użyciu knitr ##


**Uwaga ogólna**: Osoby, które nie posiadają zainstalowanej
dystrybucji LaTeX-a bądź poszukują możliwości tworzenia dokumentów
w chmurze z pewnością będą zainteresowane
[tą informacją](http://www.rexamine.com/2014/01/sharelatex-now-supports-knitr/).


-   **s.302**:

    Od niedawna `knitr` domyślnie używa `tidy=FALSE`.

# Erraty i uwagi do rozdziału 14           #
## Metody numeryczne i obliczenia naukowe ##



-   **s.307, w. 1**:

    JEST: ~~*dokonamy przeglądu metod numerycznego używanych do rozwiązywania*~~;

    POWINNO BYĆ: *dokonamy przeglądu metod używanych do numerycznego rozwiązywania*
    albo *dokonamy przeglądu metod numerycznego rozwiązywania*

# Erraty i uwagi do rozdziału 15          #
## Symulacje i wnioskowanie statystyczne ##


- __s. 350, w. -15__:

    JEST: ~~*omawiając temat funkcje agregujące*~~;

    POWINNO BYĆ: *omawiając funkcje agregujące*.


- __s. 356, w. 7__:

    JEST: ~~*exp(30)*~~;

    POWINNO BYĆ: *Exp(30)*.


- __s. 356, w. 11__:

    JEST: ~~*standardowo wbudowanych rozkładów*~~;

    POWINNO BYĆ: *wbudowanych rozkładów*.


- __s. 360, w. 4__:

    JEST: ~~*idependent indetically distributed*~~;

    POWINNO BYĆ: *independent identically distributed*.


- __s. 363, w. 12__:

    JEST: ~~*Wybrane charakterystyki rozkładów*~~;

    POWINNO BYĆ: *Wybrane estymatory charakterystyk rozkładów*.


- __s. 367, przypis 7__:

    JEST: ~~*f(1)*~~;

    POWINNO BYĆ: *runif(1)*.


- __s. 374, przedział ufności (dokładny) dla proporcji (wzór)__:

    JEST: ~~$1+\beta/2$~~;

    POWINNO BYĆ: $1-\beta/2$ (kod źródłowy poniżej wzoru jest OK).

# Erraty i uwagi do rozdziału 16          #
## Zarządzanie środowiskiem R            ##


- __s. 391, w. 6__:

    JEST: ~~*Na komputerze Autora i (Fedora...*~~;

    POWINNO BYĆ: *Na komputerze Autora (Fedora...*.


- __s. 400, tab. 16.2__:

    Podane rozmiary dotyczą 64-bitowej wersji R.

# Erraty i uwagi do rozdziału 17  #
## Środowiska                    ##


*NA*

# Erraty i uwagi do rozdziału 18    #
## Syntaktyka i semantyka języka R ##


-   **s. 430, w. 11**:

    JEST: ~~*w konsoli*~~;

    POWINNO BYĆ: *na konsoli*


-   **s. 431, w. 2**:

    JEST: ~~*Semantyka nazwy w oderwaniu od środowiska, w którym jest obliczana,
    nie ma żadnego sensu.*~~;

    POWINNO BYĆ: *Nazwy w oderwaniu od środowisk, w którym są obliczane,
    nie mają żadnego sensu.*


-   **s. 432, w. 6**:

    JEST: ~~*na konsoli w środowisku R*~~;

    POWINNO BYĆ: *na konsoli*

# Erraty i uwagi do rozdziału 19 #
## Pielęgnowanie kodu           ##


- __s. 456, tab. 19.1__:

    brakuje nawiasów `()` po nazwach funkcji od wiersza 3 do końca.


- __s. 457, ramka Ciekawostka__:

    bardzo wygodny debugger dostępny jest dopiero od wersji 0.98 RStudio,
    zob. [więcej tu](http://www.rstudio.com/ide/docs/debugging/overview).

# Erraty i uwagi do rozdziału 20         #
## Programowanie zorientowane obiektowo ##


- __s. 486, Ciekawostka__:

    Możemy też czasem definiować nowe operatory binarne bez użycia `%nazwa%`,
    np. `:=`.

# Erraty i uwagi do rozdziału 21  #
## Zakończenie                   ##


*NA*

