# Cálculo Lambda III - Teoria das Categorias

Já vimos que Cálculo Lâmbda é Turing Completo - ele consegue fazer qualquer coisa que um computador moderno consegue fazer. Mas tem uma coisa que falta pra ele ser uma linguagem de programação bonitinha: ainda não definimos **tipos**.

Por que conseguimos quase garantir que um programa em Haskell funciona? Porque ele tem uma base matemática. Para tipos não vai ser diferente - ele usa como base a **Teoria das Categorias**.

Estamos familiarizados com a Teoria das Categorias desde o Ensino Fundamental, quando aprendemos o *Domínio* das funções. Em Computação, o que agrupa os tipos e as funções é a **Categoria Hask**.

Categoria Numérica: $\R \rightarrow \R$

Categoria Hask: $\backslash x \rightarrow x$ (Int -> Int)

### No que isso muda a minha vida?

A grande maioria dos problemas de código em produção envolvem **problema de tipagem**. O **Dynamic Typing** quebra as propriedades matemáticas que garantem que uma função roda porque você perde o domínio do qual vem a função.

A Programação Funcional evita isso! Mas ainda tem um problema... *Side Effects*.

Como podemos consertar isso então? O Haskell e OCaml consertam isso com *Monads*. Lembrando, um Monad é como um trilho paralelo que permite que o programa continue a rodar até o final.

### Monads vs. Try Except

Mas pera - as linguagens com tipagem dinâmica também tem uma forma de lidar com Side Effects: o `try` / `except`. Não é a mesma coisa?

Não: existe uma diferença fundamental em paradigma. Em funcional, as funções são puras - tem uma entrada e saída definidas. O `except` com `raise` quebra o encadeamento de funções, criando como se fosse um *backdoor* na função em que tem side effect.

## Monads e Functors em Matemática

O **Functor** é uma transformação que mapeia objetos e morfismos de uma categoria para outra, preservando a identidade e a composição.

Lembra que pra aplicar o tipo `Map` em OCaml temos que definir o tipo e como vamos lidar com algumas funções? É a mesma coisa: estamos levando de um domínio genérico pra uma identidade `int`.

### Endofunctors

Um **Endofunctor** mapeia objetos de uma categoria para um objeto da mesma categoria. Sendo mais preciso, o functor `Map` é um Endofunctor, porque ele mapeia objetos da categoria `Hask` pra `Hask`.

### Monoids

**Monoid** é uma estrutura algébrica formada por um conjunto, uma operação binária ssociativa e um elemento neutro. Exemplos:

 - (INT, +, 0)
 - (STRING, CONCAT, "")
 - (LIST, EXTEND, [])

Em termos matemáticos, o **monad** é composto por:
 - Um endofunctor $T: C \rightarrow C$
 - Uma multiplicação $\mu: T \circ T \rightarrow T$:função achatamento (join)
 - Uma unidade $\eta: I \rightarrow T$ Uma função que injeta um valor *puro* (return)

Exemplo prático: Monad `Maybe`

 - $f :: Int -> Maybe Int$

## Aplicação Prática: `Applicatives`

Todo Monad é um Functor, mas nem todo Functor é um Monad. Em termos matemáticos:

 - $ Functors \subset Monads$

Existe um meio termo entre os dois: O `Applicative`

 - $ Functors \subset Applicative \subset Monads $ 

Applicatives em termos práticos é um superset de Monads que é muito útil para validações. Vamos dar uma olhada na prática:

### Exemplo Prático: Validação de Senha

Se quisermos validar que a senha:
 - Tem mais de 10 caracteres
 - Tem caractere especial
 - Tem uma letra maíuscula

Um monad pode ser uma ideia ruim porque na primeira oportunidade ele já vai pra trilho de erro.
Nesse caso é mais interessante passar pelo primeiro erro e continuar até o final para capturar todos de uma vez, devolvendo uma lista dos erros existentes.
Isso pode ser feito usando Applications. 

Na prática, Applications são úteis para:

 - Validação: devolver todos os erros de uma vez
 - Logs: processar todos os erros de uma vez

