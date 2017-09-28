require 'set'

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

part1 = 0
file_name = "input.txt"
File.open(file_name, "r") do |f|
  visited = Set.new
  pos = [0,0]
  f.each_line do |line|
  	line.split("").each do |i|
  		pos = move(pos, i)
  		unless visited.member?(pos)
  			visited.add(pos)
  			part1 += 1
  		end
  	end 
  end
end

puts "part1: #{part1}"

part2 = 0
File.open(file_name, "r") do |f|
  visited = Set.new()
  visited.add([0,0])
  pos1 = [0,0]
  pos2 = [0,0]
  f.each_line do |line|
    pos = 0
    line.split("").each do |i|
      if pos % 2 == 0
        pos1 = move(pos1, i)
      else 
        pos2 = move(pos2, i)
      end
      unless visited.member?(pos1)
        visited.add(pos1)
        part2 += 1
      end
      unless visited.member?(pos2)
        visited.add(pos2)
        part2 += 1
      end
      pos += 1
    end 
  end
end

puts "part2: #{part2}"