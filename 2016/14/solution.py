import re
import hashlib

def match_three(string):
  return re.findall(r'((\w)\2{2})', string)

def match_five(string):
  return re.findall(r'((\w)\2{4})', string)

def md5(index, num = 1):
  salt = "ahsbgdzn"
  # salt = 'abc'
  string = salt + str(index)
  for i in range(num + 1):
    string = hashlib.md5(string).hexdigest()
  return string


def solution(num = 1):
  index = 0
  possible = {}
  found = []
  while len(found) < 64:
    hash = md5(index, num)
    matches = match_three(hash)
    if len(matches):
      # possible[index] = [x[1]*5 for x in matches]
      possible[index] = matches[0][1]*5
    
    for key in possible.keys():
      if not possible[key]:
        continue
      if index - 1000 >= key:
        possible[key] = False
      elif key != index and possible[key] in hash:
        found.append(key)
    index += 1
  found.sort()
  return found

keys = solution()
print "part1:", keys[63]

keys = solution(2016)
print "part2:", keys[63]

