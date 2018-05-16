
def get_value(v):
    v = v.strip()
    try:
        return int(v)
    except ValueError:
        return int(register.get(v, 0))

register = {}
count = 0
def run_command(c, v):
    global count
    if (c == 'set'):
        register[v[0].strip()] = get_value(v[1])
    elif (c == 'sub'):
        value = get_value(v[0])
        register[v[0]] = value - get_value(v[1])
    elif (c == 'mul'):
        count += 1
        value = get_value(v[0])
        register[v[0]] = value * get_value(v[1])
    elif (c == 'jnz'):
        if int(get_value(v[0])) != 0:
            return get_value(v[1])
    return 1

register['a'] = 1
lines = open('input.txt').readlines()
current = 0
while current < len(lines):
    c = lines[current].split(' ')
    current += run_command(c[0], c[1:])

print register
print 'part1', count
