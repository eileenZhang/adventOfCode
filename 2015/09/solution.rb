file_name = 'input.txt'


def parse(line)
  left, right = line.split(' = ')
  a, b = left.split(' to ').map {|n| n.to_sym}
  [a, b, right.to_i]
end

def find_shortest_path(node, nodes_left, g, shortest)
  if nodes_left.empty?
      return shortest
  end
  path_length = []
  nodes_left.each do |n|
    dis = node ? g[node][n] : 0
    path_length << find_shortest_path(n, nodes_left - [n], g, shortest + dis)

  end
  path_length.min

end

def find_longest_path(node, nodes_left, g, longest)
  if nodes_left.empty?
      return longest
  end
  path_length = []
  nodes_left.each do |n|
    dis = node ? g[node][n] : 0
    path_length << find_longest_path(n, nodes_left - [n], g, longest + dis)

  end
  path_length.max

end

min_length = 0
max_length = 0
File.open(file_name, 'r') do |f|
  g = {}
  nodes = []
  f.each_line do |line|
    a, b, n = parse(line)

    g[a] ||= {}
    g[b] ||= {}
    
    g[a][b] = n
    g[b][a] = n
    unless nodes.include?(a)
      nodes << a
    end

    unless nodes.include?(b)
      nodes << b
    end
  end
  min_length = find_shortest_path(nil, nodes, g, 0)
  max_length = find_longest_path(nil, nodes, g, 0)

end

puts "part1: #{min_length}"
puts "part2: #{max_length}"
