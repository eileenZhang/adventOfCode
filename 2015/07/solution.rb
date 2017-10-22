$g = Array.new(1000){Array.new(1000,0)}

def is_number(str)
  if str.is_a?(Array)
    return false
  end
  str.to_s == str.to_i.to_s
end

def parse(line)
  info = []
  left, right = line.split(" -> ")
  info += parse_left(left)
  info << right.strip
  info
end

def parse_left(left)
  left = left.split()
  info = []
  if left.length == 2
    info << :NOT
    info << [left[1], nil]
  elsif  left.length == 1
    info << nil
    info << [left[0], nil]
  else
    info << left[1].to_sym
    info << [left[0], left[2]]
  end
  info
end

def find(var)
  if is_number(var)
    return var.to_i
  elsif is_number($ans[var])
    return $ans[var].to_i
  elsif not $ans[var].is_a?(Array)
    return find($ans[var])
  end
  action, new_var = $ans[var]

  if not action
    return find(var)
  end
  a = new_var[0]
  b = new_var[1]
  if action == :AND
    sol = find(a) & find(b)
  elsif action == :OR 
    sol = find(a) | find(b)
  elsif action == :LSHIFT
    sol = find(a) << find(b)
  elsif action == :RSHIFT
    sol = find(a) >> find(b)
  elsif action == :NOT
    sol = find(a) ^ 65535
  end
   $ans[var] = sol
  sol
end

$ans = {}
solution = nil
file_name = 'input.txt'
input = File.read(file_name).split("\n")

def operations(input)
  ops = {}
  input.each do |line|
    action, left, right = parse(line)
    if not action
      ops[right] = left[0]
    else
      ops[right] = [action, left]
    end
  end
  ops
end

$ans = operations(input)
new_b = find("a")
puts "part1: #{new_b}"

$ans = operations(input)
$ans['b'] = new_b
solution = find("a")
puts "part2: #{solution}"







