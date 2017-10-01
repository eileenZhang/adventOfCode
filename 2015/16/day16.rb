
file_name = "input.txt"
def parse(line)
  lst = line.split(" ")
  num = lst[1].to_i
  properties_list = {}
  properties = lst[2 .. lst.size].join.split(",")
  properties.each do |i|

    property = i.split(":")
    property_name = property[0].strip.to_sym
    value = property[1].strip.to_i
    properties_list[property_name] = value
  end
  [num, properties_list]
end

def match_property(property, value)
  return value == $master_lst[property]
end

def match_property2(property, value)
  if property == :cats || property == :trees
    return value > $master_lst[property]
  elsif property == :pomeranians || property == :goldfish
    return value < $master_lst[property]
  end
  value == $master_lst[property]
end

$master_lst = {:children => 3, :cats => 7, :samoyeds => 2, :pomeranians => 3, :akitas => 0,
               :vizslas => 0, :goldfish => 5, :trees =>3, :cars => 2, :perfumes =>1}

susan_lst = []
matching_aunts1 = []
matching_aunts2 = []
File.open(file_name, "r") do |f|
  f.each_line do |line|
    num, properties_list = parse(line)
    susan_lst[num - 1] = properties_list
  end
  susan_lst.each_with_index do |susan, index| 
    matching1 = true
    matching2 = true
    susan.each do |property, value|
      matching1 = matching1 && match_property(property, value)
      matching2 = matching2 && match_property2(property, value)
    end
    if matching1
      matching_aunts1 << (index + 1)
    end
    if matching2
      matching_aunts2 << (index + 1)
    end
  end
end

puts "part1: #{matching_aunts1}"
puts "part2: #{matching_aunts2}"
