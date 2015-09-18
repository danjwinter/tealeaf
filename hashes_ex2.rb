hash1 = {a: 1, b: 2, c:3, d: 4}
hash2 = {e: 5, f: 6}
hash3 = {g: 7, h: 8}

p hash1.merge(hash2)
p ".merge ^   hash1 v"
p hash1
p ".merge! v"
p hash1.merge!(hash3)
p "hash1 v"
p hash1
