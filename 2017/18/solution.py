
def get_value(v):
    v = v.strip()
    try:
        return int(v)
    except ValueError:
        return int(register.get(v, 0))

register = {}
register['last'] = 0

def run_command(c, v):
    if (c == 'snd'):
        value = get_value(v[0])
        if value:
            register['last'] = get_value(v[0])
    elif (c == 'set'):
        register[v[0].strip()] = get_value(v[1])
    elif (c == 'add'):
        value = get_value(v[0])
        register[v[0]] = value + get_value(v[1])
    elif (c == 'mul'):
        value = get_value(v[0])
        register[v[0]] = value * get_value(v[1])
    elif (c == 'mod'):
        value = get_value(v[0])
        register[v[0]] = value % get_value(v[1])
    elif (c == 'rcv'):
        if int(get_value(v[0])) != 0 and register['last'] != 0:
            return len(lines)
    elif (c == 'jgz'):
        if int(get_value(v[0])) != 0:
            return get_value(v[1])
    return 1


lines = open('input.txt').readlines()
current = 0
while current < len(lines):
    c = lines[current].split(' ')
    current += run_command(c[0], c[1:])

print 'part1', register['last']
