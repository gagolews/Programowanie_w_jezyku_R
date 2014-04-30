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
