
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

nice = 0
file_name = "input.txt"
File.open(file_name, "r") do |f|

  f.each_line do |line|
    if check_substring(line) && check_vowels(line) && check_consecutive(line)
      nice += 1
  	end 
  end
end

puts "#{nice}"
