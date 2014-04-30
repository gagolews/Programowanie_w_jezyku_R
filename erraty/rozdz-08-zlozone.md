# Erraty i uwagi do rozdziału 8  #
## Typy złożone                 ##



-   **s. 136, rozdz. 8.1**:

    *Macierze (...) są reprezentowane w R przez wektory **atomowe** [podkr. wł.]
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
