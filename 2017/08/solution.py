
fin = open("input.txt").read().split("\n")


values = {}
def function(a, check, value):
  if not a in values:
    values[a] = 0
  if check:
    values[a] += int(value)

max_value = -10000
for command in fin:
  line = command.split(" ")
  a = line[0]
  c = line[1]
  value = int(line[2])
  if c == "dec":
    value = -value
  b = line[4]
  if not b in values:
    values[b] = 0
  b_value = values[b]
  check = eval(str(b_value) + "".join(line[5:]))
  function(a, check, value)
  if values[a] > max_value:
    max_value = values[a]


max_final_key = max(values, key=values.get)
print "part1:", values[max_final_key]
print "part2:", max_value
