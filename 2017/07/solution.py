
fin = open("input.txt").read().split("\n")

programs = {}


def getWeight(name, tree):
    if not "children" in tree[name]:
        # print tree[name]["weight"]
        return tree[name]["weight"]
    totalweight = tree[name]["weight"]
    # print tree[name]["children"]
    for j in tree[name]["children"]:

        totalweight += getWeight(j, tree)
    return totalweight

for line in fin:
    line = line.split("-> ")
    first = line[0].split(" ")[0]
    weight = eval(line[0].split(" ")[1])
    second = line[1:]
    programs[first] = {}
    programs[first]["weight"] = weight
    if second:
        programs[first]["children"] = second[0].split(", ")

for i in programs:
    programs[i]["totalweight"] = programs[i]["weight"]
    if not 'children' in programs[i]:
        continue
    for j in programs[i]["children"]:
        programs[j]["hasParent"] = True
        programs[i]["totalweight"] += programs[j]["weight"]

root = ''
for i in programs:
    if not 'hasParent' in programs[i]:
        root = i

total = 0
max_weight = 0
min_weight = 1000000
for i in programs[root]["children"]:
    w = getWeight(i, programs)
    max_weight = w > max_weight? w: max_weight
    max_weight = w > max_weight? w: max_weight
# print "part2:", steps - start[config.index(memory_bank)] + 1
