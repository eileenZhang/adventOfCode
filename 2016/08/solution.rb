
file_name = "input.txt"


def parse(line)
  lst = line.split
  if lst.length == 2
    x,y = lst[1].split("x")
    action = [:rect, x.to_i, y.to_i]
  else
    action = [lst[1].to_sym, lst[2].split("=")[1].to_i, lst[4].to_i]
  end
  action
end

def change_light(action)
  if action[0] == :rect
    y = action[1]
    x = action[2]
    for i in 0 ... x
      for j in 0 ... y
        $g[i][j] = 1
      end
    end
  end
  if action[0] == :row
    row = action[1]
    value = action[2]
    $g[row] = $g[row].rotate(-value)
  end
  if action[0] == :column
    col = action[1]
    value = action[2]
    tmp = []
    $g.each.with_index do |row, index|
      tmp << row[col]
    end
    tmp = tmp.rotate(-value)
    $g.each.with_index do |row, index|
      row[col] = tmp[index]
    end
  end
end

def print_grid()
  $g.each do |row|
    row.each do |e|
      c = e == 0 ? '.' : "#"
      print c  + " "
    end
    puts
  end
  puts
  
end

def count_lights()
  count = 0
  $g.each do |row|
    row.each do |element|
      count += element
    end
  end
  count
end

input = File.read(file_name)
l = 6
w = 50
$g = Array.new(l) { Array.new(w, 0) }
input.split("\n").each do |line|
  action = parse(line)
  change_light(action)

end

puts "part1: #{count_lights}"
print_grid()

