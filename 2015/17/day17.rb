
file_name = "input.txt"


$count_container = {}
def count(containers_left, liters_left, container_count)
  if liters_left == 0 
    $count_container[container_count] ||= 0
    $count_container[container_count] += 1
    return container_count
  elsif liters_left < 0
    return 0
  elsif containers_left.size == 0
    return 0
  end
  len = containers_left.length
  return count(containers_left[1...len], liters_left - containers_left[0], container_count + 1) + 
         count(containers_left[1...len], liters_left, container_count)
end

containers = []
liters = 150
part1 = 0
File.open(file_name, "r") do |f|
  f.each_line do |line|
    containers << line.strip.to_i
  end
  containers.sort
  part1 = count(containers, liters, 0)
  
end
puts "part1: #{part1}"
puts "part2: #{$count_container[$count_container.keys.min]}"
