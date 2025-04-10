from multiprocessing import Process
from hashlib import sha256

results = []
def boil_eggs(i):
    sha256(b'Just something...' * 100_000_000)
    results.append(i)
    
processes = [Process(target=boil_eggs, args=(i,)) for i in range(3)]
for p in processes: p.start()
for p in processes: p.join()
print(results)