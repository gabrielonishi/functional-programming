# 18 - Cálculo Lambda

É possível criar uma linguagem de programação usando só a notação do cálculo lambda.

Nessa aula veremos como o cálculo lâmbda é capaz de fazer isso e como isso influencia linguagens funcionais, como o Haskell.

Curiosidade: função sem nome em Haskell

```haskell
(\x -> x)
```

O \x tenta imitar o lambda ($\lambda$)

Na aula:
 - Definimos booleanos
 - Definimos números
 - Definimos álgebra

Conceitos
 - **Function Composition**: Caso do cálculo -> $f(x) \circ g(x) = f(g(x))$
 - **Currying**: Toda função multi-argumento pode ser reescrita em uma função mono-argumento
 - **Binding**: Em funcional, não tem variáveis - existem *igualdades*.
 - **Partial Application**: Pegar uma função de n argumentos e aplicar ela usando m argumentos, com m < n