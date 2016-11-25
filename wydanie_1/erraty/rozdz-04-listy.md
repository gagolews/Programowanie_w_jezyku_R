# Erraty i uwagi do rozdziału 4 #
## Listy                       ##


-   **s. 62**:

    Wartą zanotowania funkcją jest ponadto `is.list()`.


-   **s. 63, ramka Informacja**:

    JEST: ~~*`NULL < logical < raw < integer < ...`*~~;

    POWINNO BYĆ: *`NULL < raw < logical < integer < ...`*,
    por. `c(TRUE, as.raw(0))` oraz `c(NULL, as.raw(0))`.

