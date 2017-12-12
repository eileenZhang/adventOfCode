
fin = open("input.txt").read().split("\n")

def find_group():
  v = [visited.index(0)]
  while len(v) != 0:
    first = v.pop(0)
    visited[first] = 1
    for i in graph[first]:
      if not visited[i]:
        v.append(i)

graph = []
for i in fin:
  g = i.split("<->")
  graph.append(map(int, g[1].split(",")))


visited = [0] * len(graph)

group = 0

while sum(visited) != len(graph):
  find_group()
  group += 1
  if group == 1:
    print "part1", sum(visited)

print "part2", group


