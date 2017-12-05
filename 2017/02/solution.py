

fin = open("input.txt").read().split("\n")


def difference(spreadsheet):
    check_sum = 0
    for i in spreadsheet:
        line = map(int, i.split(" "))
        row = line.sort()
        a = line[-1]
        b = line[0]
        check_sum += (a - b)
    return check_sum

def divide(spreadsheet):
    check_sum = 0
    for i in spreadsheet:
        line = map(int, i.split(" "))
        for j in range(len(line)):
            for k in range(len(line)):
                if line[j] % line[k] == 0 and k != j:
                    a = line[j]
                    b = line[k]
        
        check_sum += a / b

    return check_sum

print "part1:", difference(fin)
print "part2:", divide(fin)