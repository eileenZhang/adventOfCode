
class Program:
    def __init__(self, program_num):
        self.program_num = program_num
        self.registers = {}
        self.program_counter = 0
        self.message_queue = []
        self.message_count = 0
        self.instructions = open('input.txt').readlines()
        self.end = False
        self.blocked = False
        self.registers['p'] = program_num


    def get_value(self, v):
        try:
            v = v.strip()
            return int(v)
        except ValueError:
            return int(self.registers.get(v, 0))

    def run_command(self):
        if len(self.message_queue) > 0:
            self.blocked = False;
        if self.program_counter < 0 or self.program_counter >= len(self.instructions):
            self.end = True
            return
        line = self.instructions[self.program_counter].split(' ')
        v = line[1:]
        c = line[0]
        x = v[0].strip()
        value0 = self.get_value(x)

        if (c == 'snd'):
            self.message_count += 1
            self.other.message_queue.append(value0)
        elif (c == 'rcv'):
            try:
                self.registers[x] = self.message_queue.pop(0)
            except IndexError:
                self.blocked = True
                return
        elif (c == 'set'):
            self.registers[x] = self.get_value(v[1])
        elif (c == 'add'):
            self.registers[x] = value0 +  self.get_value(v[1])
        elif (c == 'mul'):
            self.registers[x] = value0 *  self.get_value(v[1])
        elif (c == 'mod'):
            self.registers[x] = value0 %  self.get_value(v[1])
        elif (c == 'jgz'):
            if value0 > 0:
                self.program_counter += self.get_value(v[1])
                return
        self.program_counter += 1

p0 = Program(0)
p1 = Program(1)
p0.other = p1
p1.other = p0
while  not (p0.blocked and p1.blocked) or (p0.end or p1.end):
    # print p0.program_counter, p1.program_counter
    p0.run_command()
    p1.run_command()
print 'part2', p1.message_count
