file_name = "input.txt"

def count(string)
  new_length = 0
  i = 0
  while i < string.length
    if string[i] == "\""
      i += 1
      next
    end
    new_length += 1
    if string[i..i+1] == "\\\\" || string[i..i+1] == "\\\""
      i += 2
      next
    elsif string[i..i+1] == "\\x"
      i += 4
      next
    end
    
    i += 1
  end
  new_length
end

def expand_count(string)
  new_length = string.length
  string.each_char do |c|
    if c == "\\" || c == "\""
      new_length += 1
    end
  end
  new_length += 2
  new_length

end


code_length = 0
string_length = 0
expand_length = 0
File.open(file_name, "r") do |f|
  f.each_line do |line|
    line = line.strip
    code_length += line.length
    string_length += count(line)
    expand_length += expand_count(line)
  end
end

part1 = code_length - string_length
part2 = expand_length - code_length
puts "part1: #{part1}"
puts "part2: #{part2}"
