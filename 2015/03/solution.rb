
def move(pos,c)
  case c
  when "<"
    pos[0] -= 1
  when ">"
    pos[0] += 1
  when "^"
    pos[1] += 1
  when "v"
    pos[1] -= 1
  end
  pos
end

input = File.read('input.txt').split("\n")

visited = [[0,0]]
pos = [0,0]
input.each do |line|
  line.split("").each do |i|
    pos = move(pos, i)
    visited << pos.clone
  end 
end

puts "part1: #{visited.uniq.size}"

visited = [[0,0]]
pos1 = [0,0]
pos2 = [0,0]
pos = 0

input.each do |line|
  line.split("").each do |i|
    if pos % 2 == 0
      pos1 = move(pos1, i)
      visited << pos1.clone
    else 
      pos2 = move(pos2, i)
      visited << pos2.clone
    end
    pos += 1
  end 
end

puts "part2: #{visited.uniq.size}"