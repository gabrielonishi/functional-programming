# Aula 15 - Concorrência e Paralelismo

Qual a diferença entre os dois?

A diferença é que a concorrência é **monothread**. Isto é, apesar de aparentar ser paralelo, ele na verdade só faz algumas atividades enquanto esperam o resultado de outras - principalmente processamentos IO.

Paralelismo já depende de uma arquitetura certa pra isso. O computador tem que ser multi-core.

Exemplo: Uma endpoint que recebe muitas requisições ao mesmo tempo. Qual escolher?

Resposta: Depende! O que o seu webserver faz? Muitas contas, consumindo muita CPU? Aí é paralelismo. Ele fica muito tempo ocioso, esperando o recebimento de dados do cliente? Aí é concorrência.

Analogia: Cozinha

 - Um chefe de cozinha que corta a cebola enquanto a panela esquenta está fazendo concorrência
 - Um chefe de cozinha que chama outro chefe pra cortar cebola com ele está fazendo paralelismo

## Concorrência

Curiosidade em python: O código abaixo tem qual output?

```python
import asyncio

async def boil_eggs():
    print("Boiling eggs")
    print("Eggs done")

boil_eggs()
```

Nenhum! `boil_eggs()` retorna um *coroutine object*, parecido com uma promise. Esse objeto espera um coordenador de eventos falar que ele pode rodar. Esse coordenador é o *task manager* do Python, o `asyncio.run`.

Adicionando mais coisas ao código

```python
import asyncio
from random import randint

async def boil_eggs(i):
    print(f"Boiling eggs {i}")
    await Asyncio.sleep(randint(1, 3))
    print(f"Egg {i} done!")

async def main():
    t1 = asyncio.create_task(boil_eggs(1))
    t2 = asyncio.create_task(boil_eggs(2))
    await t1
    await t2

asyncio.run(main())
``` 

Qual vai ser a ordem dos prints?

Resposta:

```
Boiling eggs 1
Boiling eggs 2
...
```

A segunda parte depende do sleep!

### Quando usar concorrência?

Qualquer coisa que tem tempo morto:

 - Web services (HTTP requests)
 - Banco de dados
 - Sistema de arquivos 
 - Websockets
 - Qualquer outra operação assíncrona

## Paralelismo

"Se o gargalo for CPU, abandona o Python" - Raul

Existem dois tipos principais de paralelismo:
 - Multithreading
 - Multiprocessing

Qual a diferença entre os dois?

Multithreading compartilha o mesmo espaço de memória dentro de um único processo.
Requer suporte do sistema operacional e da arquitetura do processador.

```python
from theading import thread

results = []
def boil_eggs(i):
    sha256('Bla bla' * 100_000_000)
    result.append(i)

threads = 
...
```

Qual o output do programa?

Apesar de parecer que está paralelizando, isso não acontece por conta do Python. Ele usa um mecanismo chamado GIL para serealizar as threads. Ele garanta que não tenha problemas de lock, race-condition, etc. Qualquer linguagem com GIL não vai fazer multithreading.

```python
from threading import Thread, Lock
import time

locks = [Lock() for _ in range (2)]

def thread(lock_a, lock_b): 
    with lock_a:
        sleep(0, 1)
        with lock_b:
            print('I win!')

threads = [Thread(target=thread, args=(locks[0], locks[1]))
           Thread(target=thread, args=(locks[1], locks[0]))]

for t in threads: t.start()
for t in threads: t.join()
```

Quando rodamos com o GIL, ele vai tratar isso como concorrência - como se tivesse um `await` antes do sleep. O código fica análogo ao código de cima.
Quando rodamos sem o GIL, aí a coisa fica feia... temos a situação de **deadlock**. O código fica preso e não roda mais.

