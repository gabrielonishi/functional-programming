# Lab Haskell

## Exercícios

**Functions**
 1. Define a function `double` that doubles a number
 2. Define a function `square` that squares a number
 3. Define a function that receives a prefix and returns a new function that adds the prefix to any string
 4. Define a function that calculates a simple hash: $h(x) = (x^2 mod n)$
 5. Define a function that takes 3 numbers and returns the largest one
 6. Define a function `isEven` that returns `True` if a number is even

**Pattern Matching** 
 1. Define a function called `describe_number` that returns the name of a number (as a string) up to 5. Return `other` for numbers greater than 6.
 2. Define a function `headOfList` that returns the first element of a list using pattern matching
 3. Define a function `isEmpty` that returns `True` if a list is empty
 4. Define a function `tupleSum` that takes a pair of numbers (x, y) and returns x + y
 5. Define a function that receives a point tuple (x, y) and returns a text indicating whether x and y are equal, or wheter x 

Algumas notas sobre o Haskell:
 - É influenciado pelo ML ("filho" do Lisp) que nem OCaml
 - Tem compilador Lazy Evaluate
 - Precisa de uma função `main` para funcionar
 - Que nem Python, confia *muito* na identação

## Boas Práticas

 - Não ter preguiça de usar `type annotation`
 - Usar `camelCase` para nome de função (`functionOne`)
 - Usar `PascalCase` para `types` e `modules`
 - Nunca usar `snake_case` nem `SCREAMING_SNAKE_CASE`