# Aula 02 - Lab de OCaml

## Practice Exercises

 - **1.** Escreva uma função que calcula um hash simples: h(x) = (x^2 mod n)
 - **2.** Escreva uma função que recebe 3 números e retorna o maior
 - **3.** Escreva uma função que calcula a soma dos dígitos de um número
 - **4.** Escreva uma função que calcula o n-ésimo número de Tribonacci
 - **5.** Escreva uma função que verifica se um número é primo
 - **6.** Escreva uma função que retorna o próximo primo
 - **7.** Escreva uma função que recebe um prefixo e devolve uma função que adiciona o prefixo a qualquer string

### Maneiras de Rodar

1. Usando REPL (terminal interativo)
```bash
ocaml
```
2. Usando interpretador (python style)
```bash
ocaml main.ml
```
3. Gerar bytecode (java style)
```bash
ocamlc -o main.bc main.ml
ocamlrun main.b
```
4. Gerar executável (C style)
```
ocaml -o main main.ml
```

Foco em *Expressions* ao invés de *Statements*

Expressions:
 - Constantes
 - Operações matemáticas, booleanas e relacionais
 - Chamadas de função

Statements:
 - Condicionais
 - Loops
 - Function definition
 
### let (definition)
 
```ocaml
let x = 2 ;;
```

Na memória, cria atribui um pedaço da memória associado a x e associa à 2

OCaml é fortemente tipado com type inference. 
Dá pra trocar o tipo depois sem problemas.
Mas fazer operações com tipos diferentes não rola:

```ocaml
let 2 + 3.5 ;;
```

Dá erro por dois motivos:
 - Soma de int e float
 - Operador errado! Tem que falar que é soma de float (`+.`)

Certo:

```ocaml
let 2. +. 3.5 ;;
```

### let in (Expression)

Permite você atribuir valores dentro de um escopo

```ocaml
let x = 2 ;;
let x = 1 in x ;;
```

O que acontece nessa segunda linha é a atribuição de `x = 1` dentro do escopo da expressão.
Se printarmos x, x vai ser 2!

Quando usamos `let in` vamos criar um escopo, uma caixinha na memória que deixa de existir assim que saímos do contexto.

Dá também pra usar *nested scopes*.

```ocaml
let x = 5 in let y = 2 in x + y
```

O escopo mais interno é pra esquerda e o mais externo na direita.

Para ler de maneira funcional: "Seja x = 5 no contexto que y é 2, quanto fica x + y?"

Em programação funcional, os programadores tendem a não ligar tanto para nomes de variáveis. Isso acontece porque as variáveis não são reutilizadas durante o programa, elas só existem dentro do escopo, da função.

De uma olhada no seguinte programa:

```ocaml
let x = 1;;
let x = 2;;
```

Na última aula, falamos que as Ocaml era imutável. Esse programa roda?

Sim! Porque os dois x são diferentes. O programa acima é equivalente ao programa:

```ocaml
let x = 1 in let x = 2 in x
```

### Principais statements

Temos o equivalente ao ternário do Python pra usar *conditionals*

### Functions

Funções e variáveis são iguais em funcional! Tira o argumento da função - ela "vira" uma variável.

O que chamamos de variável é uma **função constante**.

Declaration:

```ocaml
let f x = x + 1 ;;
let g x y = x + y ;;
```

Application:

```ocaml
f 3 ;;
g 2 3 ;;
```

O que acontece quando mandamos o "número errado de argumentos"?

```ocaml
g (2 + 1)
```

Em Python, isso levantaria um erro semântico. Em ocaml não. O que estamos fazendo é criando uma subfunção com um monoargumento. O nome desse fenômeno é *currying*.

Na verdade na verdade, o currying acontece sempre. No exemplo `g 2 3`, fazemos duas chamadas: uma parcial que chama a função e que depois é chamada com o outro argumento.

### Lambda (Funções Anônimas)

```ocaml
(fun x -> x + 1) ;;
let inc = fun x -> x + 1 ;;
```

A variável inc é uma função que não recebe argumento que retorna uma outra função lambda, que recebe um argumento e adiciona 1 ao argumento

### Recursão

```ocaml
let rec fact n =
    if n = 0 then 1
    else n * fact n - 1 ;;

fact 5;;
```

Qual o resultado disso? Stack Overflow!!!

Como resolvemos?

Quando chama na segunda linha da recursão (else), calcula primeiro fact n. Temos que colocar um ()!

```ocaml
let rec fact n =
    if n = 0 then 1
    else n * fact (n - 1) ;;

fact 5;;
```