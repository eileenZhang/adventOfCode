
fin = open("input.txt").read().split(",")


def distance(coord):
  x = abs(coord[0])
  y = abs(coord[1])
  return max([x, y, y-x])

visited_dist = set()
coord = [0,0]
for d in fin:
  if d == "n":
    coord[1] += 1
  if d == "ne":
    coord[0] += 1
    coord[1] += 1
  if d == "se":
    coord[0] += 1
  if d == "s":
    coord[1] -= 1
  if d == "sw":
    coord[0] -= 1
    coord[1] -= 1
  if d == "nw":
    coord[0] -= 1
  visited_dist.add(distance(coord))

print "part1:", distance(coord)
print "part2:", max(visited_dist) 

