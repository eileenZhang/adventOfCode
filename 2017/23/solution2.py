
h = 0

def prime(b):
    for d in range(2, int(b ** .5 + 1)):
        if (b % d == 0): return False
    return True

for b in range(106700, 123701, 17):
    if (not prime(b)):
        h += 1

print "part2", h
