

def is_number(n)
  if n.class == Symbol
    return false
  end
  return n.to_i.to_s == n.to_s
end

file_name = "input.txt"
# value 5 goes to bot 2
def parse(line)
  lst = line.split(" ")
  command = lst[0].to_sym
  a = lst[1]
  if is_number(lst[1])
    a = a.to_i
  else
    a = a.to_sym
  end

  b = lst[2]
  if b && is_number(b)
    b = b.to_i
  elsif b
    b = b.to_sym
  end
  [command, a, b]
end

def run(command, a, b, index)
  print command, a, b
  puts
  if command == :cpy
    value = is_number(a) ? a.to_i : $values[a]
    $values[b] = value
  elsif command == :inc
    $values[a] += 1
  elsif command == :dec
    $values[a] -= 1
  elsif command == :jnz
    if $values[a] != 0
      b = is_number(b) ? b.to_i : $values[b]
      return index + b
    end
  elsif command == :tgl
    toggle(command, a, index)
  end
  index + 1
end

def toggle(command, a, index)
  v = $values[a]
  puts "toggle #{index + v}"
  if index + v >= $commands.length
    return
  end
  c = $commands[index + v]
 
  if c[0] == :inc
    c[0] = :dec
  elsif c[0] == :dec || c[0] == :tgl
    c[0] = :inc
  elsif c[0] == :jnz
    c[0] = :cpy
  elsif c[0] == :cpy
    c[0] = :jnz
  end
  $commands[index + v] = c

end

$values = {:a => 7, :b => 0, :c => 0, :d =>0}
input = File.read(file_name)
$commands = []
input.split("\n").each do |line|
  $commands << parse(line)
end

# i = 0
# while i != $commands.length
#   c = $commands[i]
#   print i, $values
#   puts
#   i = run(c[0], c[1], c[2], i)

# end
# puts "part1: #{$values[:a]}"


i = 0
$values = {:a => 12, :b => 0, :c => 0, :d =>0}
while i != $commands.length
  c = $commands[i]
  print i, $values
  puts

  i = run(c[0], c[1], c[2], i)
end

puts "part2: #{$values[:a]}"

