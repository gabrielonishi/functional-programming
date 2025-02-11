# Aula 03 - Imutabilidade

## Imutabilidade

Um dos grandes problemas do Python - que na verdade também é uma vantagem para programadores novos - é a mutabilidade das suas variáveis. Podemos fazer uma função que recebe um DataFrame do pandas, por exemplo, que modifica o df original quando na verdade queríamos criar uma cópia alterada do df. Isso acontece porque o Python manda as variáveis da função por **referência**. Isso pode dar origens a bugs e comportamentos não esperados.

### Funções Puras

São funções que sempre que recebe um mesmo input tem um mesmo output. Isso quer dizer que elas:
 - Não alteram variáveis externas
 - Não alteram estrutura de dados
 - Não interagem com o mundo externo (IO Print/Read, Request...)

Funções são determinísticas e previsíveis. Isso quer dizer que elas deixam o código:
 - Mais seguro
 - Mais testável
 - Mais adequado para concorrência

O conceito é lindo. Mas funciona na prática? Como faríamos pra fazer um projeto com aplicação no mundo real mantendo a pureza das funções?

Existe uma maneira de cercear esse problema: `monads`. Não vamos falar muito sobre eles

Como transformamos uma função impura em uma função pura?

```python
database = {}

def add_person(name, age):
    if name not in database:
        database[name] = age

add_person('Raul', '40')
```

O problema é que modificamos uma variável externa.

Pra deixar ela pura, como fazemos em OCaml, temos que criar uma nova variável copiando os valores do original e alterando essa nova variável.

```python
database = {}

def add_person(database, name, age):
    if name in database:
        return database
    return {**database, name: age}

new_db = add_person(database, 'Raul', 40)
```
