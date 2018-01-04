import re

commands = open("input.txt").read().split("\n")


def get_value(y):
    if re.match('[\-0-9]', y):
        return int(y)
    else:
        return register[y]

i = 0
register = {}
count = 0
while 0 <= i and i < len(commands):
    command, x, y = commands[i].split(" ")
    y = get_value(y)
    if x not in register:
        register[x] = 0
    if command == "set":
        register[x] = y
    if command == "sub":
        register[x] -= y
    if command == "mul":
        register[x] *= y
        count += 1
    if command == "jnz" and get_value(x):
        i += y
    else:
        i += 1

print "part1:", count
b = 67 * 100 + 100000
c = 67 + 17000
h = 0

while True:
    f = 1
    d = 2
    while d * d < b:
        if b % d == 0:
            f = 0
            break
        d += 1

    if (f == 0):
        h += 1
    g = b - c
    b += 17
    if g == 0:
        break

print "part2:", h
