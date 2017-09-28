
def check_substring(string)
  not ['ab', 'cd', 'pq', 'xy'].any? { |word| string.include?(word) }
end


def check_vowels(string)
  total_v = 0
  v = "aeiou".split("")
  v.each do |i|
    total_v += string.count(i)
  end
  total_v >= 3
end

def check_consecutive(string)
  c = false
  for i in 0 ... string.length - 1
    if string[i] == string[i+1]
      c = true
    end
  end
  c
end

def check_pair(string)
  check = {}
  pair = false
  for i in 0 ... string.length
    c = string[i .. i+1]
    if check[c] == i - 1
      next
    end
    if not check[c]
      check[c] = i
    else 
      pair = true
    end
  end
  pair
end


def check_repeat(string)
  check = {}
  repeat = false
  for i in 0 ... string.length - 2
    if string[i] == string[i+2]
      repeat = true
      break
    end
  end
  repeat
end


part1 = 0
part2 = 0
file_name = "input.txt"
File.open(file_name, "r") do |f|

  f.each_line do |line|
    if check_substring(line) && check_vowels(line) && check_consecutive(line)
      part1 += 1
  	end 
    if check_pair(line) && check_repeat(line)
      part2 += 1
    end
  end
end

puts "part1: #{part1}"
puts "part2: #{part2}"
