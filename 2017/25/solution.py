

state = 'A'
steps = 12861455
tape = [0] * steps
current = 12861455/2

for i in range(steps):
    value = tape[current]
    if state == 'A':
        state = 'B'
        tape[current] = (value + 1) % 2
        if value == 0:
            current += 1
        elif value == 1:
            current -= 1
    elif state == 'B':
        tape[current] = (value + 1) % 2
        if value == 0:
            state = 'C'
            current -= 1
        elif value == 1:
            current += 1
            state = 'E'
    elif state == 'C':
        tape[current] = (value + 1) % 2
        if value == 0:
            state = 'E'
            current += 1
        elif value == 1:
            current -= 1
            state = 'D'
    elif state == 'D':
        tape[current] = 1
        current -= 1
        state = 'A'
    elif state == 'E':
        tape[current] = 0
        current += 1
        if value == 0:
            state = 'A'
        elif value == 1:
            state = 'F'
    elif state == 'F':
        tape[current] = 1
        current += 1
        if value == 0:
            state = 'E'
        elif value == 1:
            state = 'A'

print "part1", sum(tape)
