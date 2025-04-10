#!/usr/bin/python3.13-nogil

from threading import Thread
from hashlib import sha256

results = []
def boil_eggs(i):
    sha256(b'Just something...' * 100_000_000)
    results.append(i)

threads = [Thread(target=boil_eggs, args=(i,)) for i in range(3)]
for t in threads: t.start()
for t in threads: t.join() # Equivalente ao await
print(results)