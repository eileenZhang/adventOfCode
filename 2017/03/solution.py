

def print_array(arr):
  for i in arr:
      print i
  print

def get_sum(x, y):
  cord = [(-1, -1), (-1,0), (-1, 1), (0,-1), (0, 1), (1,-1), (1,0), (1, 1)]
  total = 0
  print "--------------"
  print x,y
  print_array(ans)
  for c in cord:
    print c
    print (x + c[0], y + c[1])
    print ans[x + c[0]][y + c[1]]
    total += ans[x + c[0]][y + c[1]]
  if total == 0:
    total += 1
  return total

n = 265149
length = int(n**0.5)
# n = 9
# length = 5

x = (length - 1)/2
y = (length - 1)/2
l = 1
start = (x,y)

counter = 0
num = 1
ans = [[0] * length for i in range(length)]
reached = False
cord = [(0,1), (-1,0), (0,-1), (1,0)]

while not reached:
  for c in cord:
    for a in range(l):
      ans[x][y] = get_sum(x,y)
      if ans[x][y] >= n:
        reached = True
        break
      x += c[0]
      y += c[1]
      num += 1
    counter += 1
    if counter == 2:
      l += 1
      counter = 0
    if reached:
      break

# print_array(ans)
# print "part1:", abs(start[0] - x) + abs(start[0] - y)
print "part1:", ans[x][y]
