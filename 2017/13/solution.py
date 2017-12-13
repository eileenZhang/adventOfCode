
lines = []
for line in open("input.txt").readlines():
    lines.append(map(int, line.split(': ')))


def scanner(height, time):
    cycle = (height - 1) * 2
    offset = time % cycle
    if offset > height - 1:
        return cycle - offset
    return offset

firewall = {}
for pos, height in lines:
    firewall[pos] = height

penalty = 0
for pos in firewall:
    if scanner(firewall[pos], pos) == 0:
        penalty += pos * firewall[pos]

print "part1:", penalty

delay = 0
while True:
    detect = False
    for pos in firewall:
        if scanner(firewall[pos], delay + pos) == 0:
            detect = True
            break
    if not detect:
        break
    delay += 1

print "part2:", delay
