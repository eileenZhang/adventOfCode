
file_name = "input.txt"

input = File.read(file_name)

triangle_count = 0
input.split("\n").each do |line|
  triangles = []
  line.split(" ").each do |c|
    if c != ''
      triangles << c.to_i
    end
  end
  triangles = triangles.sort
  if triangles[0] + triangles[1] > triangles[2]
    triangle_count += 1
  end

end

puts "part1: #{triangle_count}"

triangle_count = 0
g = []
input.split("\n").each do |line|
  triangles = []
  line.split(" ").each do |c|
    if c != ''
      triangles << c.to_i
    end
  end
  g << triangles
  if g.count == 3
    for i in 0 .. 2
      t = []
      for j in 0 .. 2
        t << g[j][i]
      end
      t = t.sort
      if t[0] + t[1] > t[2]
        triangle_count += 1
      end
    end
    g = []
  end

end
puts "part2: #{triangle_count}"
