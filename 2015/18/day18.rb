
file_name = "input.txt"


def count_light(i, j, g)
  neighbours = [g[i-1][j-1], g[i-1][j], g[i-1][j+1], g[i][j-1], 
                g[i][j+1], g[i+1][j-1], g[i+1][j], g[i+1][j+1]]
  neighbours.count("#")
end

def count_neighbours(g)
  neighbours = []
  neighbours << ([0] * $grid_size)
  for i in 1 ... (g.length() -1)
    n = [0]
    for j in 1 ... (g[0].length() -1)

      n << count_light(i, j, g)
    end
    n << [0]
    neighbours << n
    
  end
  neighbours << ([0] * $grid_size)
  neighbours
end

def change_lights(neighbours_light_count, g)
  neighbours = []
  neighbours << (['.'] * $grid_size)
  for i in 1 ... (g.length() -1)
    n = []
    n << '.'
    for j in 1 ... (g[0].length() -1)
      light = neighbours_light_count[i][j]
      if g[i][j] == "#"
        if light == 2 || light == 3
          n << "#"
        else
          n << "."
        end
      else
        if light == 3
          n << "#"
        else
          n << "."
        end
      end
    end
    n << '.'
    neighbours << n
  end
  neighbours << (['.'] * $grid_size)
  corner_light(neighbours)
  neighbours
end

def count_all_light(g)
  total = 0
  g.each do |n|
    total += n.count("#")

  end
  total
end

def corner_light(g)
  g[1][1] = '#'
  g[1][100] = '#'
  g[100][1] = '#'
  g[100][100] = '#'
end
g = []
part1 = 0
$grid_size = 100 + 2
File.open(file_name, "r") do |f|
  g << ['.'] * $grid_size
  f.each_line do |line|
    g << (['.'] + line.strip.split('') + ['.'])
  end
  g << ['.'] * $grid_size
  corner_light(g)
  for step in 1 .. 100
    neighbours = count_neighbours(g)
    g = change_lights(neighbours, g)
    
  end
end
total_light = count_all_light(g)
puts "part1: #{total_light}"
# puts "part2: #{$count_container[$count_container.keys.min]}"
