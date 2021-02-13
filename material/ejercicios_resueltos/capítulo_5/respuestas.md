### Notas previas:
- Hemos cambiado el símbolo «λ» por «lambda» para que el intérprete lo pueda ejecutar.
- Todos los ejercicios pueden ser verificados en: https://jacksongl.github.io/files/demo/lambda/

### 5-1

```
((lambda x.x) (lambda y.y)) (lambda z.z)
```

Respuesta:

```
(((λx.x) (λy.y)) (λz.z))
((λy.y) (λz.z))
(λz.z)
```


### 5-2

```
((lambda x.(lambda y.y)) 1)
```

Respuesta:

```
((λx.(λy.y)) 1)
(λy.y)
```

### 5-3

```
((((lambda x.x) 1) 2) 3)
```

Respuesta:

```
((((λx.x) 1) 2) 3)
((1 2) 3)
```

### 5-4

```
((lambda x.x) (lambda y.y)) ((lambda x.x) 2)
```

Respuesta:

```
(((λx.x) (λy.y)) ((λx0.x0) 2))
((λy.y) ((λx0.x0) 2))
((λx0.x0) 2)
2
```

### 5-5

Hay un error en este ejercicio en el libro: no es «(lambda x.(xx) 1)» sino «(lambda x.(x x) 1)», como se ve a continuación:

```
((lambda x.(x x) 1) ((lambda y.2) (lambda z.z)))
```

Respuesta:

```
((λx.((x x) 1)) ((λy.2) (λz.z)))
((((λy.2) (λz.z)) ((λy.2) (λz.z))) 1)
((((λy.2) (λz.z)) ((λx0.2) (λx1.x1))) 1)
((2 ((λx0.2) (λx1.x1))) 1)
((2 2) 1)
``` 