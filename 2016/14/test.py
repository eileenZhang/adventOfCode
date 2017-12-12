import hashlib, collections

# salt = 'abc'
salt = 'zpqevtbw'
    start = 0

print(start)
with open('13.txt', 'a') as fp:
    for n in range(start, start+1000):
        seed = '{}{}'.format(salt, n).encode()
        digest = hashlib.md5(seed).hexdigest()
        # for _ in range(2016): digest = hashlib.md5(digest.encode()).hexdigest()
        fp.write(digest+'\n')

found = set()
track = collections.defaultdict(list)
with open('13.txt') as fp:
    for i, digest in enumerate(fp.read().splitlines()):
        try:
            f = next(cs[0] for cs in zip(digest, digest[1:], digest[2:], digest[3:], digest[4:]) if len(set(cs))==1)
            for j in track[f]:
                if 0<(i-j)<=1000:
                    found.add(j)
        except:
            pass

        try:
            t = next(cs[0] for cs in zip(digest, digest[1:], digest[2:]) if len(set(cs))==1)
            track[t].append(i)
        except:
            pass

print(sorted(found)[63])

