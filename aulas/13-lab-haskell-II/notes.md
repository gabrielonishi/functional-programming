# Lab Haskell II - HOF & Types

## Exercícios

Usando `map`:
1. Write a function that doubles every number in a list using map.
2. Write a function that adds 1 to every number in a list.
3. Convert a list of numbers into a list of strings using show and map.
4. Use map to extract the first letter of a list of strings.
5. Write a function that capitalizes all characters in a string (list of Char).

Usando `foldr/foldl` :
1. Write a function that computes the sum of a list using foldr.
2. Write a function that computes the product of a list using foldl.
3. Use foldr to concatenate a list of strings.
4. Use foldl to reverse a list.
5. Count the number of elements in a list using foldr (like implementing length).

Usando `filter` :
1. Write a function that removes all even numbers from a list.
2. Write a function that keeps only numbers greater than 10.
3. Write a function that filters out empty strings from a list of strings.
4. Write a function that keeps only vowels from a string.
5. Write a function that filters names that start with the letter 'A'.

Usando function composition:
1. Define a function that increments a number and then doubles it, using function composition.
2. Use composition to convert a number to a string and then compute its length.
3. Compose functions to check if a number is even after adding 5.
4. Use map with a composed function (e.g., map (show . (*2))).
5. Write a composed function that takes a list of numbers, removes odd numbers, and doubles the
result.


## Retomando

 - Haskell é funcional puro, estaticamente tipado e lazy evaluation
 - Função tratadas como valores
 - Funções podem ser compostas

Programação funcional é tudo relacionado à legibilidade - evitar a *pyramid of doom*

## Map / Reduce

### Em outras linguagens

Obs: Olhar código dos slides

Criar um código coeso em Python, mesmo usando funcional, acaba virando mais verboso do que as alternativas funcionais.
Vale a pena criar rápido e "na volta a gente compra"?

### Haskell

```haskell
apply :: [a -> b] -> [a] -> [b]
apply _ [] = []
apply f (x:xs) = f x apply (f xs)
```

Como ler o código acima?

`apply :: [a -> b] -> [a] -> [b]`

É o type annotation da função 
 - Parâmetro 1: uma função que recebe um `generic a` para um `generic b`
 - Parâmetro 2: uma lista de tipo `generic a`
 - Retorna: `generic b`

`apply _ [] = []`

Caso base da recursão. Se receber qualquer coisa e uma lista vazia, devolve uma lista vazia

`apply f (x:xs) = f x apply f xs`

Aplica f no head e faz a recursão enviando o mesmo f e o tail.

É como o `map` funciona por baixo dos panos!

### Fold Left/Right

Existe alguma diferença real entre usar o `foldl` e o `foldr`?

Existe **se a operação não for associativa!**

Por exemplo, não faz diferença na soma de uma lista em um acumulador por conta da propriedade da soma:

`(a + b) + c = a + (b + c)`

A soma é uma operação associativa - a ordem dos fatores não altera o resultado.

Agora se fizessemos uma divisão...

## Tipos

### Type Alias

**Com a devida anotação, ganha-se a documentação**

Além de fazer tipos próprios, também conseguimos fazer operações com eles. O único porem é que tem que implementar o `show`.

```haskell
data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun

isWeekend :: DayOfWeek -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False

data Day = DayOfWeek Int
today :: Day
todas :: Day Thu 20

showDayNumber (Day _ d) = show d

main :: IO ()
main = do
    putStrLn $ show $ isWeekend Fri
    putStrLn $ show $ showDayNumber today
``` 

