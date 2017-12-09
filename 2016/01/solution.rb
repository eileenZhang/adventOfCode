
file_name = "input.txt"

input = File.read(file_name)
compass = [:north, :east, :south, :west]
direction = :north
basement = false
pos = [0,0]
input.split(", ").each do |i|
  d = i[0]
  s = i[1 ... i.length].to_i

  if d == "R"
    direction = compass[(compass.index(direction) + 1)%4]
  else
    direction = compass[(compass.index(direction) - 1)%4]
  end
  case direction
  when :north
    pos[0] += s
  when :south
    pos[0] -= s
  when :east
    pos[1] += s
  when :west
    pos[1] -= s
  end
end

puts "part1: #{pos[0].abs + pos[1].abs}"
# puts "part2: #{pos}"
pos = [0,0]
visited = {}
visited_twice = []
input.split(", ").each do |i|
  d = i[0]
  s = i[1 ... i.length].to_i
  
  if d == "R"
    direction = compass[(compass.index(direction) + 1)%4]
  else
    direction = compass[(compass.index(direction) - 1)%4]
  end
  for i in 1 .. s
    visited[pos[0]] ||= {}
    visited[pos[0]][pos[1]] = true
    case direction
    when :north
      pos[0] += 1
    when :south
      pos[0] -= 1
    when :east
      pos[1] += 1
    when :west
      pos[1] -= 1
    end

    if visited[pos[0]] && visited[pos[0]][pos[1]] 
      break
    end
  end
  if visited[pos[0]] && visited[pos[0]][pos[1]] 
    break
  end
end
puts "part2: #{pos[0].abs + pos[1].abs}"
