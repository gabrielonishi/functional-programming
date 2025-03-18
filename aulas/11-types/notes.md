# Aula 07

O que é um tipo? Como definiríamos um tipo para uma pessoa que nunca foi introduzida à esse contexto?

O tipo nos dirá:
 - A estrutura de dados
 - Como manipulamos essa estrutura de dados

Mas essa definição muda pra cada paradigma da programação. OOP vai falar que que os tipos são objetos; a declarativa vai falar que é a definição de um *schema*. **A funcional vai ter uma definição mais matemática**.

## Por debaixo do capô

Como o compilador do OCaml lida com os tipo.

1. **Static Types**: tipagem do tipo durante a compilação (erro sintático). Se tiver um *type mismatch*, nem compila. Isso faz com que o desenvolvimento seja muito mais lento, mas que existam menos erros de execução (erro semântico - *runtime errors*).

2. **Dynamic Types**: tipagem durante a execução (erro semântico)

*Nota:* Não existe um melhor do que o outro. Se quero prototipar algo rapidamente, algo com tipagem dinâmica é muito mais interessante. Só temos que saber que estamos coletando uma série de dívidas técnicas para se lidar depois.

Algumas coisas que são consequência de como lidamos com tipos:

**Polimorfismo**: um objeto pode ter várias formas, permite *herança*. Ao mesmo que é do tipo `Veiculo` é do tipo `Carro`.
**Generics**: *kind of Type Constructor*. Você recebe o tipo como argumento pra criar a variável.

## Tipos no Funcional

Tipos são um mecanismo de defesa contra programas que não fazem sentido antes mesmo de sua execução.

Em OCaml, temos uma definição matemática. Tipos são Sets de outros tipos:

 - `char`: tamanho finito (8-bits = 256)
 - `string`: tamanho infinito

### Type Constructors

Parecido com Generics. Um construtor que recebe um tipo.

`type 'a option = Some 'a | None`

### Algebraic Data Types

```ocaml
type `a tree =
    | Leaf
    | Node of `a node
and `a node = {
    value: `a;
    left: `a tree;
    right: `a tree
}
``` 

### Generalized Algebraic Data Types

Uma extensão do ADT

```ocaml
type token =
    | Int of int
    | Bool of bool
```

Basicamente um Union de tipos. O problema é que o compilador não vai saber usar esse tipo - trato ele como um `int` ou um `bool`? A solução é usar GADTs

Solução:

```ocaml
type _ token =
    | Int : int -> int token
    | Bool: bool -> bool token
```

Agora podemos criar esse tipo e desmontar para usar o valor

```ocaml
let x : bool token = Bool true ;;
let y : int token = int 42 ;;

(* eval takes a token, decomposing the type for matching *)
let eval : type a. a token -> function
    | Int x -> x
    | Bool b -> b ;;

eval x ;; (* - : bool = true *)
eval y ;; (* - : int = 42 *)
```

Que caralhos é `a.`? É a sintaxe que eles usam pra **decomposição**.

Que caralhos é `_`? É a sintaxe para qualquer coisa.
