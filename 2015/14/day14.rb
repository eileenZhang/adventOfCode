
file_name = "input.txt"
def parse(line)
	lst = line.split(" ")
	name = lst[0].to_sym
	speed = lst[3].to_i
	fly_time = lst[6].to_i
	rest_time = lst[-2].to_i
	[name, {:score => 0, :speed => speed, :fly_time => fly_time, :rest_time => rest_time, :current => :fly, :dist => 0, :fly => 0, :rest => 0}]
end

def time_pass(name)
  current = $info[name][:current]
  if current == :fly
    $info[name][:dist] += $info[name][:speed]
    $info[name][:fly] += 1
  
    if $info[name][:fly] == $info[name][:fly_time]
      $info[name][:current] = :rest
      $info[name][:fly] = 0
    end
  else
    $info[name][:rest] += 1
    if $info[name][:rest] == $info[name][:rest_time]
      $info[name][:current] = :fly
      $info[name][:rest] = 0
    end
  end
end


$info = {}
reindeer = []
max_dist = 0
max_score = 0

File.open(file_name, "r") do |f|
  f.each_line do |line|
    name, info = parse(line)
    $info[name] = info
    reindeer << name
  end
  for i in 1 .. 2503
  	reindeer.each do |name|
  		time_pass(name)
  	end

    max_dist2 = 0
    fastest = []
    reindeer.each do |name|
      if $info[name][:dist] > max_dist2
        max_dist2 = $info[name][:dist]
        fastest = [name]
      elsif $info[name][:dist] == max_dist2
        fastest << name
      end
    end
    fastest.each do |name|
      $info[name][:score] += 1
    end
  end

  reindeer.each do |name|
    if $info[name][:dist] > max_dist
      max_dist = $info[name][:dist]
    end
  end

  reindeer.each do |name|
    max_score = [$info[name][:score], max_score].max
  end
end

puts "part1: #{max_dist}"
puts "part2: #{max_score}"
