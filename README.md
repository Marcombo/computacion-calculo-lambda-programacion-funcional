# Computación y programación funcional
#### Introducción al cálculo lambda y programación funcional usando Racket y Python. Marcombo, 2021.


## Actualización
- 8 de Agosto 2021. Este artículo es la continuación al libro: https://www.researchgate.net/publication/354765192_Introduccion_a_la_programacion_funcional_usando_Haskell_y_Agda
- 28 de Julio 2021. Se corrige un error en el código del capítulo 12: [funciones-puras-copy-list-recursiva.py](material/cap%C3%ADtulo_12/ejemplos/funciones-puras-copy-list-recursiva.py). Pág. 187.
- 31 de mayo 2021. Se añade una sección de [fe de erratas](erratas.md).
- 18 de febrero 2021. Añadí una sección con lecturas recomendadas. Véase [aquí](recomendaciones.md).
- 13 de febrero 2021. Se han añadido las respuestas a los ejercicios del capítulo 5. Véase [aquí](material/ejercicios_resueltos/capítulo_5/respuestas.md).


## Sipnosis

<a href="https://www.marcombo.com/computacion-y-programacion-funcional-9788426732439/"><img src="img/libro-01.jpg" alt="Computación y programación funcional" height="400px" align="right"></a>

La **programación funcional** ofrece diversas ventajas a la hora de construir software: reducción de errores, manejo eficiente de datos en entornos concurrentes y paralelos, y un gran respaldo teórico. No obstante, muchos programadores fracasan en su intento de adentrarse en ella por ir directamente a aprenderla usando un lenguaje de programación (tecnología), con lo que omiten la teoría y el contexto histórico que le dio origen.

Este libro incluye una introducción sobre qué son la computación y la programación en pos de delimitar su campo de acción. En segundo lugar, presenta el **cálculo lambda**, el modelo de computación que influenció a la programación funcional en los años cuando ni siquiera existían los lenguajes de programación, ni mucho menos los ordenadores digitales. Para concluir, el libro emplea los lenguajes de programación **Racket** y **Python** para enseñar las diversas características de la programación funcional, sus fortalezas y debilidades, y cómo ellas pueden combinarse con otros paradigmas. Con todo ello, aprenderá:

* La visión general de la computación, la programación y los lenguajes de programación.
* Los fundamentos que subyacen a la programación funcional, como el cálculo lambda.
* Las diferencias entre el cálculo lambda libre de tipos y tipado.
* La aplicación de estos conceptos en un lenguaje de programación de estirpe funcional, como lo es Racket, y en otro de uso masivo, como Python.
* El diseño y la construcción de un pequeño lenguaje de programación usando el enfoque funcional.

Si tiene un mínimo conocimiento en programación y desea adentrarse en **otra forma de pensar y construir sistemas computacionales**, donde viven conceptos como reducción, funciones puras, transparencia referencial, búsqueda de patrones, entre otros, no espere más para hacerse con este libro. Gracias a él no descubrirá tan solo la programación funcional, sino que ampliará su perspectiva con respecto a la computación desde una óptica sistémica y libre de dogmas.

**[Ver índice](https://docdro.id/u5lnpgj)**


## Sobre este repositorio

En este repositorio se encuentra los códigos de ejemplos presentados en el libro, junto a sus figuras.  Dentro de la carpeta [material](material/) se divide el contenido por cada capítulo.  A su vez, dentro de la carpeta que refiere a cada capítulo existen dos: ejemplos (códigos) y figuras.

### Códigos de ejemplos

#### Requisitos

El libro usa las últimas versiones de cada lenguaje al momento de escribirlo:

- Racket (versión 7.7, [descargar](https://download.racket-lang.org/)) 
- Python (versión 3.8.2, [descargar](https://www.python.org/downloads/))
- Haskell (versión 8.6.5, [descargar](https://www.haskell.org/platform/))

(Los códigos de ejemplo fueron probados para esas versiones; de todas formas, para versiones posteriores no debería haber problemas en ejecutar cada ejemplo, ya que no se utilizan caracteristicias muy especificas, sino más bien genericas. Pero, en caso de ocurrir algún error, por favor ir a contacto o cree una issue.)


Los códigos disponibles son los que aparecen en la **parte III** del libro. Agrupados por nombre de _algoritmo_ o _función_ presentada, para **Racket** (.rkt) y **Python** (.py). (Excepto para el capítulo 10 donde se presenta Haskell, leer más abajo.)

Por ejemplo, para el algoritmo karp-rabin que se presenta en el capítulo 14 existen dos ficheros: [karp-rabin.rkt](material/capítulo_14/ejemplos/karp-rabin.rkt) y [karp-rabin.py](material/capítulo_14/ejemplos/karp-rabin.py) que son los dos códigos presentados en el libro, para cada lenguaje de programación.

Por otro lado, los códigos de **Haskell** que solo aparecen en el capítulo 10, tienen la extensión .hs y están [aquí](material/capítulo_10/ejemplos).

**Nota:** También puede usar IDE online para cada uno: https://ideone.com/, en caso de tener algún problema en la instalación de algún lenguaje.



### Figuras

Dentro de cada capítulo se encuentra la carpeta figuras. Donde todas ellas siguen la misma enumeración del libro.

### Intérpretes para el cálculo lambda 

* [λ Calculus Interpreter](https://jacksongl.github.io/files/demo/lambda/)

### Contacto

En caso de cualquier inconveniente o sugerencia, por favor escribir a: camilochs@gmail.com
