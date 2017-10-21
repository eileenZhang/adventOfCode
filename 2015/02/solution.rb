
wrapping_paper_size = 0
ribbon_length = 0
file_name = "input.txt"

File.open(file_name, "r") do |f|
  f.each_line do |line|
    l,w,h = line.split("x").map(&:to_i)
    lst = [l,w,h].sort

    a = (l*w)
    b = (w*h)
    c = (h*l)
    sa = 2 * (a + b + c)
    wrapping_paper_size += sa + lst[0] * lst[1]

    p = 2 * lst[0] + 2 * lst[1]
    v = l*w*h
    ribbon_length += p + v
  end
end

puts "part1 #{wrapping_paper_size}"
puts "part1 #{ribbon_length}"
