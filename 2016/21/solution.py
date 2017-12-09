
def reverse(string, x, y):
    return string[:x] + list(reversed(string[x:y+1])) + string[y+1:]

def swap_pos(string, x, y):
    temp = string[y]
    string[y] = string[x]
    string[x] = temp
    return string

def swap_letter(string, x, y):
    for i in range(len(string)):
        if string[i] == x:
            string[i] = y
        elif string[i] == y:
            string[i] = x
    return string

def rotate(string, step, left):
    length = len(string)
    if left:    
        return string[step:] + string[:step]
    return string[length - step:] + string[:length - step]

def rotate_pos(string, b, scramble):
    index = string.index(b)
    step = index + 1
    if index >= 4:
        step += 1
    return rotate(string, step, not scramble)


def reverse_rotate_pos(string, b, scramble):
    string = rotate(string, step, not scramble)
    while True
        index = string.index(b)
    step = index + 1
    if index >= 4:
        step += 1
    return rotate(string, step, not scramble)


def move(string, x, y):
    if x < y: 
        return string[:x] + string[x+1:y + 1] + [string[x]] + string[y + 1:]
    else:
        return string[:y] + [string[x]] + string[y : x] + string[x + 1:]


def scramble(string, line):
    line = line.split(" ")
    command = line[0]
    if command == "swap":
        if line[1] == "position":
            # swap position 4 with position 0
            return swap_pos(string, int(line[2]), int(line[-1]))
        elif line[1] == "letter":
            # swap letter d with letter b
            return swap_letter(string, line[2], line[-1])
    if command == "reverse":
        # reverse positions 0 through 4
        return reverse(string, int(line[2]), int(line[-1]))
    if command == "rotate":
        if line[1] == "based":
            # rotate based on position of letter b
            return rotate_pos(string, line[-1], True)
        # rotate left 1 step
        return rotate(string, int(line[2]), line[1] == "left")
        
    if command == "move":
        # move position 3 to position 0
        return move(string, int(line[2]), int(line[-1]))

def unscramble(string, line):
    line = line.split(" ")
    command = line[0]
    if command == "swap":
        if line[1] == "position":
            # swap position 4 with position 0
            return swap_pos(string, int(line[-1]), int(line[2]))
        elif line[1] == "letter":
            # swap letter d with letter b
            return swap_letter(string, line[-1], line[2])
    if command == "reverse":
        # reverse positions 0 through 4
        return reverse(string, int(line[2]), int(line[-1]))
    if command == "rotate":
        if line[1] == "based":
            # rotate based on position of letter b
            return rotate_pos(string, line[-1], False)
        # rotate left 1 step
        return rotate(string, int(line[2]), line[1] != "left")
        
    if command == "move":
        # move position 3 to position 0
        return move(string, int(line[-1]), int(line[2]))

fin = open("input.txt").read().split("\n")

string = list("abcdefgh")

for line in fin:
    string = scramble(string, line)


# print "part1:", "".join(string)

string = list("decab")
for line in fin[::-1]:
    print line
    string = unscramble(string, line)
    print "".join(string)

print "part2:", "".join(string)

