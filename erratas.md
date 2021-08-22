### Fe de Erratas 

| Nº       | Fecha  | Página        |    Error      |  Solución | Nota |
|----------|:------:|:-------------:|:------:|:-----------------:|:------:|
| 1 | 31/05/2021 | 84 | En el cap. 5, página 84, en la lista de ejemplos hay un error en el segundo. Dice: *Si tenemos (λ x. (λ y. (λ z.z))), la variable "x" si es bound*. | Lo correcto sería: *Si tenemos (λ x. (λ y. (λ z.**x**))), la variable "x" si es bound*. | Gracias a Guillermo Llancaqueo por detectarlo.
| 2 | 22/08/2021 | 85 | Dice: *Una variable es free cuando no existe en el cuerpo de la función lambda*. | Lo correcto sería: *Una variable es free cuando existe en el cuerpo y no en la cabecera de la función lambda*. | Gracias a [Felipe Santa-Cruz](https://github.com/fesanmar) por detectarlo.
