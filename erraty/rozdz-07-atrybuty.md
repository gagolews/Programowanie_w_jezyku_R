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
