readings = {'children': 3, 'cats': 7, 'samoyeds': 2, 'pomeranians': 3, 'akitas': 0,
          'vizslas': 0, 'goldfish': 5, 'trees': 3, 'cars': 2, 'perfumes': 1}

# the cats and trees readings indicates that there are greater than that many
# the pomeranians and goldfish readings indicate that there are fewer than
def match(compound, value):
    if compound in ('cats', 'trees'):
        return value > readings[compound]
    if compound in ('pomeranians', 'goldfish'):
        return value < readings[compound]
    return readings[compound] == value

with open("input.txt") as f:
    for line in f:
        pos = line.find(':')
        candidate, raw_attributes = line[:pos], line[pos+2:-1]

        attributes = [x.split(': ') for x in raw_attributes.split(', ')]
        if (all(match(c, int(v)) for c, v in attributes)):
            print(candidate, attributes)
