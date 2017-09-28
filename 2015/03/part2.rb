
require 'set'

total = 1

def move(x,y,c)
	case c
	when "<"
		x -= 1
	when ">"
		x += 1
	when "^"
		y += 1
	when "v"
		y -= 1
	end
	[x,y]

end

file_name = "input.txt"
File.open(file_name, "r") do |f|
  visited = Set.new()
  visited.add([0,0])
  x1 = 0
  y1 = 0
  x2 = 0
  y2 = 0
  f.each_line do |line|
  	pos = 3
  	line.split("").each do |i|
  		pos += 1
  		if pos % 2 == 0
  			x1, y1 = move(x1,y1,i)
  		else 
  			x2, y2 = move(x2,y2,i)
  		end
  		unless visited.member?([x1,y1])
  			visited.add([x1,y1])
  			total += 1
  		end
  		unless visited.member?([x2,y2])
  			visited.add([x2,y2])
  			total += 1
  		end
  	end 
  end
end

puts "#{total}"
