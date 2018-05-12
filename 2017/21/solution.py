n1 = 10000
n2 = 10000000
t = 900
directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]

def create_grid():
    g = []
    lines = open("input.txt").read().strip().split("\n")

    extra = ["."] * (t/2)
    total = t + len(lines)
    for i in range(total):
        g.append(["."] * total)

    for line in lines:
        row = extra[:] + list(line) + extra[:]
        g.append(row)

    for i in range(total):
        g.append(["."] * total)
    return g

def burst(x, y, d):
    global count1
    if grid1[x][y] == '#':
        d = (d + 1) % 4
        grid1[x][y] = '.'
    elif grid1[x][y] == '.':
        count1 += 1
        d = (d - 1) % 4
        grid1[x][y] = '#'
    return x + directions[d][0], y + directions[d][1], d

def burst2(x, y, d):
    global count2
    if grid2[x][y] == '#':
        d = (d + 1) % 4
        grid2[x][y] = 'f'
    elif grid2[x][y] == '.':
        d = (d - 1) % 4
        grid2[x][y] = 'w'
    elif grid2[x][y] == 'w':
        count2 += 1
        grid2[x][y] = '#'
    elif grid2[x][y] == 'f':
        d = (d + 2) % 4
        grid2[x][y] = '.'
    return x + directions[d][0], y + directions[d][1], d

def print_grid(x, y):
    print d
    for i in range(len(grid)):
        line = []
        for j in range(len(grid[i])):
            if x == i and y == j:
                line.append("[" + grid[i][j] + "]")
            else:
                line.append(grid[i][j])
        print line
    print

grid1 = create_grid()
grid2 = create_grid()


x1 = len(grid1)/2
y1 = len(grid1[0])/2
x2 = len(grid2)/2
y2 = len(grid2[0])/2
d1 = 0
d2 = 0
count1 = 0
count2 = 0

for i in range(n2):
    if i < n1:
        x1, y1, d1 = burst(x1, y1, d1)
    x2, y2, d2 = burst2(x2, y2, d2)

print "part1:", count1
print "part2:", count2
