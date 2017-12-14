
input = "xlqgujun"
# input = "flqrgnkx"


def hex_to_bin(string):
    return "{x:>0128}".format(x=bin(int(string, 16))[2:])


def knot_hash(input, repeat=1):
    current, skip_size = 0, 0
    lst = list(range(256))
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


def find_group(x, y):
    if x >= 128 or y >= 128 or x < 0 or y < 0 or grid[x][y] == 0:
        return
    grid[x][y] = 0
    coords = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    for c in coords:
        find_group(x + c[0], y + c[1])


count = 0
grid = []
for index in range(128):
    fin = input + "-" + str(index)
    input_lst = [ord(c) for c in fin] + [17, 31, 73, 47, 23]
    lst = knot_hash(input_lst, 64)

    hash = ''
    for i in range(0, 256, 16):

        x = [lst[i + j] for j in range(16)]
        hash += '%02x' % reduce(lambda x, y: x ^ y, x)

    row = hex_to_bin(hash)
    grid.append(map(int, list(row)))
    count += row.count("1")

print "part1:", count

group = 0

for i in range(len(grid)):
    for j in range(len(grid[0])):
        if grid[i][j] == 1:
            group += 1
            find_group(i, j)
print "part2:", group
