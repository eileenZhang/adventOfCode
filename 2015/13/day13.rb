
file_name = "input.txt"
def parse(line)
	lst = line.split(" ")
	name1 = lst[0].to_sym
	name2 = lst[-1].tr(".", "").to_sym
	happiness = lst[2] == "gain" ? lst[3].to_i : -lst[3].to_i
	[name1, name2, happiness]
end

def net_happiness(p1, p2, happiness_chart)
	if happiness_chart[p1] == nil || happiness_chart[p2] == nil
		return 0
	end
	 
	happiness_chart[p1][p2] + happiness_chart[p2][p1]
end

def max_happiness(person, first, people_left, happiness, happiness_chart)
	if people_left.empty?
		return happiness + net_happiness(person, first, happiness_chart)
	end
	greatest_happiness = []
	people_left.each do |p|
		happy = net_happiness(person, p, happiness_chart)
		greatest_happiness << max_happiness(p, first, people_left - [p], happiness + happy, happiness_chart)
	end
	greatest_happiness.max
end

happiness_chart = {}
people = []	
part1 = 0
part2 = 0
File.open(file_name, "r") do |f|
  sum = 0
  happiness_chart[:me] = nil
  f.each_line do |line|
    name1, name2, happiness = parse(line)
    happiness_chart[name1] ||= {}
    happiness_chart[name1][name2] = happiness
    unless people.include?(name1) 
    	people << name1
    end
    unless people.include?(name2)
    	people << name2
    end
    
  end
  first_person = people[0]
  people.shift
  part1 = max_happiness(first_person, first_person, people, 0, happiness_chart)
  people.unshift(first_person)
  part2 = max_happiness(:me, :me, people, 0, happiness_chart)
  
end

puts "part1: #{part1}"
puts "part2: #{part2}"
