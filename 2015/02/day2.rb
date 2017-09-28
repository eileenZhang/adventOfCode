
part1 = 0
part2 = 0
file_name = "input.txt"

File.open(file_name, "r") do |f|
  f.each_line do |line|
  	l,w,h = line.split("x").map(&:to_i)
  	a = (l*w)
  	b = (w*h)
  	c = (h*l)
  	sa = 2 * (a + b + c)
  	part1 += sa + [a, b, b].min

  	lst = [l,w,h].sort
  	p = 2 * lst[0] + 2 * lst[1]
  	v = l*w*h
  	part2 += p + v
  end
end

puts "part1 #{part1}"
puts "part1 #{part2}"
