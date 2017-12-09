
fin = open("input.txt").read().split("\n")

ranges = []
for line in fin:
    line = map(int,line.split("-"))
    ranges.append(line)

ranges.sort()
max_ip = 4294967295
ranges.append([max_ip + 1, max_ip + 1])


def solution():
    ip = 0
    for start, end in ranges:
        if ip < start:
            break
        ip = max(ip, end + 1)
    return ip


def solution2():
    ip = 0
    count = 0
    for start, end in ranges:
        if ip < start:
            count += start - ip
        ip = max(ip, end + 1)
    return count

print solution2()
