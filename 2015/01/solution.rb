
level = 0
file_name = "input.txt"

input = File.read(file_name)
basement_pos = 0
pos = 0
input.split("").each do |i|
	if i == "("
		level += 1
	elsif i == ")"
		level -= 1
	end
  pos += 1
	if level == -1 && basement_pos == 0
		basement_pos = pos
	end
end

puts "part1: #{level}"
puts "part2: #{basement_pos}"
