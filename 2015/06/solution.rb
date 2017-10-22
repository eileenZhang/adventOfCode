$g = Array.new(1000){Array.new(1000,0)}

def parse(line)
  info = []
  line = line.split()
  if line.length == 4
    info << :toggle
    info << line[1].split(",").map(&:to_i)
    info << line[3].split(",").map(&:to_i)
  elsif  line[1] == "on"
    info << :on
    info << line[2].split(",").map(&:to_i)
    info << line[4].split(",").map(&:to_i)
  elsif line[1] == "off"
    info << :off
    info << line[2].split(",").map(&:to_i)
    info << line[4].split(",").map(&:to_i)
  end
  info
end

def change_lights(action, x, y)
  if action == :on
    $g[x][y] = 1
  elsif action == :off 
    $g[x][y] = 0
  elsif action == :toggle
    $g[x][y] = ($g[x][y] + 1) %2
  end
end

def change_brightness(action, x, y)
  if action == :on
    $g[x][y] += 1
  elsif action == :off 
    $g[x][y] = [0, $g[x][y] -1].max
  elsif action == :toggle
    $g[x][y] += 2
  end
end

file_name = "input.txt"
input = File.read(file_name).split("\n")

lights = 0
input.each do |line|
  action, p1, p2 = parse(line)
  for x in p1[0] .. p2[0] 
    for y in p1[1] .. p2[1]
      change_lights(action, x, y)
    end
  end
end

$g.each do |x|
  x.each do |element|
    lights += element
  end
end
puts "part1: #{lights}"

lights = 0
$g = Array.new(1000){Array.new(1000,0)}

input.each do |line|
  action, p1, p2 = parse(line)
  for x in p1[0] .. p2[0] 
    for y in p1[1] .. p2[1]
      change_brightness(action, x, y)
    end
  end
end

$g.each do |x|
  x.each do |element|
    lights += element
  end
end
puts "part2: #{lights}"




