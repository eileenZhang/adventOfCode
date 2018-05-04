import re

def get_input():
    lines = open('input.txt').readlines()
    particles = []
    r = re.compile('p=<([ \-\d,+]+)>, v=<([ \-\d,+]+)>, a=<([ \-\d,+]+)>')

    for line in lines:
        m = r.match(line)
        if m:
            pos, vel, acc = m.groups()
            particle = {}
            particle['p'] = [int(x) for x in pos.split(',')]
            particle['v'] = [int(x) for x in vel.split(',')]
            particle['a'] = [int(x) for x in acc.split(',')]
            particles.append(particle)
    return particles


particles = get_input()
for i in range(1000):
    for particle in particles:
        particle['v'] = map(lambda i: particle['v'][i] + particle['a'][i], range(3))
        particle['p'] = map(lambda i: particle['p'][i] + particle['v'][i], range(3))
        particle['d'] = sum(abs(x) for x in particle['p'] )

    min_particle = min(particles, key = lambda x: x['d'])
    min_particle['min_count'] = min_particle.get('min_count', 0) + 1

id = particles.index(max(particles, key = lambda x: x.get('min_count', 0)))
print 'part1:', id

particles = get_input()
for i in range(1000):
    positions = {}
    for particle in particles:
        particle['v'] = map(lambda i: particle['v'][i] + particle['a'][i], range(3))
        particle['p'] = map(lambda i: particle['p'][i] + particle['v'][i], range(3))


        pos_key = ','.join([str(x) for x in particle['p']])
        new_pos = positions.get(pos_key, [])
        new_pos.append(particle)
        positions[pos_key] = new_pos

    for k, v in positions.iteritems():
        if len(v) > 1:
            map(lambda p: particles.remove(p), v)

print 'part2:', len(particles)
