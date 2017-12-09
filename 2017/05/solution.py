

fin = open("input.txt").read().split("\n")


i = 0
steps = 0
while True:
    if i == len(fin):
        break
    new_i = i + int(fin[i])
    if int(fin[i]) >= 3:
        fin[i] = int(fin[i]) - 1
    else:
        fin[i] = int(fin[i]) + 1
    i = new_i
    steps += 1

print steps