
level = 0
file_name = "input.txt"

input = File.read(file_name)
pos = 0
basement = false

input.split("").each do |i|
	if i == "("
		level += 1
	elsif i == ")"
		level -= 1
	end
	if !basement
		pos += 1
	end
	if level == -1 && !basement
		basement = true
	end
end

puts "part1: #{level}"
puts "part2: #{pos}"
