
def knot_hash(input, repeat=1):
    current, skip_size = 0, 0
    lst = list(range(n))
    for _ in range(repeat):
        for length in input:
            length = int(length)

            new_lst = lst[:] + lst[:]
            re = list(reversed(new_lst[current: (current + length)]))
            k = current
            for j in range(len(re)):
                lst[(k + j) % len(lst)] = re[j]

            current = (current + length + skip_size) % len(lst)
            skip_size += 1

    return lst

fin = open("input.txt").read()
input = map(int, fin.split(","))
n = 256

current, skip_size = (0, 0)

lst = knot_hash(input)

print "part1:", lst[0] * lst[1]

input = [ord(c) for c in fin] + [17, 31, 73, 47, 23]
lst = knot_hash(input, 64)

hash = ''
for i in range(0, 256, 16):
    x = [lst[i + j] for j in range(16)]
    hash += '%02x' % reduce(lambda x, y: x ^ y, x)

print "part2:", hash
