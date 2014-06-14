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

