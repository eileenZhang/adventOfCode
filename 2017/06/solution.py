
fin = map(int, open("input.txt").read().split(" "))

def redistribute(config):
    bank = config.index(max(config))
    items = config[bank]
    config[bank] = 0
    for i in range(items):
        bank = (bank + 1) % len(config)
        config[bank] += 1
    return config

steps = 0
config = []
start = []
memory_bank = fin[:]

while True:
    if memory_bank in config:
        break 
    steps += 1
    config.append(memory_bank[:])
    start.append(steps)
    memory_bank = redistribute(memory_bank)

print "part1:", steps
print "part2:", steps - start[config.index(memory_bank)] + 1
