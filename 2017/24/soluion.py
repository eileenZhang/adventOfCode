

def connect_component(bridge, component):
    if bridge[-1][1] == component[0]:
        return component
    elif bridge[-1][1] == component[1]:
        return [component[1], component[0]]

    return None

def build_bridge(bridge, components):
    if len(components) == 0:
        return [bridge]
    bridges = []
    for i in range(len(components)):
        c = connect_component(bridge, components[i])
        if c != None:
            new_bridge = bridge[:]
            new_bridge.append(c)
            components_left = components[:i] + components[i+1:]
            bridges += build_bridge(new_bridge, components_left)
        elif bridge not in bridges:
            bridges.append(bridge)
    return bridges

def strength(bridge):
    sum = 0
    for i in bridge:
        sum += i[0] + i[1]
    return sum

input = open('input.txt').read().strip().split("\n")
components = map(lambda x: map(int, x.split("/")), input)
start = [[0, 45], [0, 39], [0, 43]]
bridges = []

for i in start:
    bridges += build_bridge([i], components)

print "part1", max(map(strength, bridges))

max_length = max(map(len, bridges))
filtered = list(filter(lambda x: len(x) == max_length, bridges))

print "part2", max(map(strength, filtered))
