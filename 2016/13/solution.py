
def space(input, x,y):
  num = bin(x*x + 3*x + 2*x*y + y + y*y + input)[2:].count("1")
  return num % 2 == 0 and x >= 0 and y >= 0

input = 1352
des = (31,39)

possible_steps = [[0,1], [0,-1], [1,0], [-1,0]]

current = [[1, 1, 0]]

explored = {}
while len(current) > 0:
  print current
  p = []
  c = current.pop()
  for x in possible_steps:
    next_x, next_y = c[0] + x[0], c[1] + x[1]
    if space(input, next_x, next_y):
      if not (next_x, next_y) in explored or explored[(next_x, next_y)] > c[2]:
        explored[(next_x, next_y)] = c[2] + 1
        current.append([next_x, next_y, c[2] + 1])

print "part1:", explored[des]

location_count = 0
for l in explored:
  if explored[l] <= 50:
    location_count += 1

print "part2:", location_count