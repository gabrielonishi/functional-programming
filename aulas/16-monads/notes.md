# Aula 16 - Monads

Monads são uma ferramenta do arcabouço funcional para lidar com exceções. 

Quando pensamos em como um programa funcional opera, pensamos em uma cadeia de funções. Mas isso é quando as coisas funcionam da maneira que queremos - mas e quando temos uma exceção? Os monads entram como um trilho paralelo ao cenário sem exceção que não é processado pelas outras funções.

### Exemplo 1

Se você gostaria de encadear duas funções `invert` e `double`

```haskell
invert :: Float -> Float
invert x = 1 / x

double :: Float -> Float
double x = 2 * x

invertDouble :: Float -> Float -> Float
invertDouble = invert . double
```

Essas funções são puras, mas a matemática não. Se x for 0, isso vai pra `infinity` no Haskell, mas não queremos lidar com esse caso. Como podemos lidar com essa exceção?

```haskell
invert :: Float -> Maybe Float
invert 0 = Nothing
invert x = Just ( 1 / x)

double :: Float -> Float
double x = 2 * x

invertDouble :: Float -> Maybe Float
invertDouble x = double <$> safeInvert x

<!-- Versão alternativa -->
invertDouble :: Float -> Maybe Float
invertDouble x = do
    a <- safeInvert x
    return (double a)
```

Algumas observações sobre os monads desse exemplo:
 - Buraco negro dos monads: Uma vez que se usa um monad, todas as funções da cadeia vão virar monádicas. Não dá pra você tratar a exceção e continuar sem ser monadicamente, vai ter que carregar isso até o final da execução.
 - Operador `<$>`: Faz a aplicação functorial - extrai o valor do monad e aplica na função pura. Toda vez que fazer o encadeamento de funções com monads, tem que usar esse operador
 - Operador `do`: Usado pra lidar com exceções. Estamos acostumados a usar pra IO
 - Operador `return`: Não é igual ao `return` do Python. O return sempre é 

### Exemplo 2

Lidando com `Exceptions` em um exemplo real

```haskell
saveClient :: [a] -> Either String Bool
saveClient fields =
    validate fields >>= saveDB >>= sendEmail
```

 - Operador `>>=`: É o **encadeamento monádico**. Seria o equialente do `|>` do OCaml
 - `Either` é um monad para isolar `Exceptions`

## Por que o Haskell é obcecado por pureza?

Monads são usados justamente pra conseguir seguir a pureza

A vantagem não está na previsibilidade, mas na **facilidade de paralelizar**.

As funções são todas puras por design, então sabemos que as funções vão ser paralelizáveis na essência.