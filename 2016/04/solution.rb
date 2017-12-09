
file_name = "input.txt"

input = File.read(file_name)


def parse(line)
  lst = line.split("[")
  check_sum = lst[1].chomp("]")
  lst = lst[0].split("-")
  sector = lst[-1].to_i
  
  room = lst[0 ... lst.length - 1].join()
  {:room => room, :sector => sector, :check_sum => check_sum}
end

def create_check(room)
  count = {}
  room.each_char do |c|
    count[c] ||= 0
    count[c] += 1
  end
  # some magic here o.o
  count = Hash[count.sort{ |(k1, v1), (k2, v2)| [v2, k1] <=> [v1, k2] }]
  count.keys[0 ... 5].join
end

def check_valid(room_info)
  if create_check(room_info[:room]) == room_info[:check_sum]
    return true
  end
  false
end

sum = 0
valid = []
input.split("\n").each do |line|
  room_info = parse(line)
  if check_valid(room_info)
    sum += room_info[:sector]
    valid << room_info
  end
end

puts "part1: #{sum}"


def decrpyt(room, sector)
  decrpyted_name = ''
  room.each_char do |c|
    let = ((c.ord - 97 + sector) % 26 + 97).chr
    decrpyted_name += let
  end
  decrpyted_name
end


valid.each do |line|
  if decrpyt(line[:room], line[:sector]).start_with?("northpole")
    puts "part2: #{line[:sector]}"
  end
end
