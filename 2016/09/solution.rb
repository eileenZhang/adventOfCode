
file_name = "input.txt"

def next_command(line)
  state = :begining
  before = ""
  after = ""
  command_start_index = nil
  command_end_index = nil
  command = nil
  line.each_char.with_index do |c, index|
    if state == :begining && c == "("
      state = :command
      before = line[0 ... index]
      command_start_index = index + 1
    end
    if state == :command && c == ")"
      state = :end
      a,b = line[command_start_index  ... index].split("x")
      command = {}
      command[:num] = a.to_i
      command[:repeat] = b.to_i
      command[:arg] = line[index + 1 .. index + a.to_i]
      command_end_index = index + a.to_i + 1
      break
    end
  end
  if command_end_index
    after = line[command_end_index ... line.length]
  else
    before = line
  end
  [before, command, after]
end


def count_string(line)
  if line == ""
    return 0
  end
  if !line
    return 0
  end
  length = 0
  while line.length != 0
    b, command, e = next_command(line)
    length += b.length
    if command
      length += command[:repeat] * count_string(command[:arg])
    end
    line = e
  end
  length
end

def expand(before, command)
  if command == nil
    return before
  end
  n_command = next_command(command[:arg])
  
  c = expand(n_command[0], n_command[1])

  string = before
  for i in 0 ... command[:repeat]
    string += c
  end
  string += expand(n_command[2])
  string
end

input = File.read(file_name)
total_length = 0
input.split("\n").each do |line|
  string = ""
  b, command, e = next_command(line)
  while line.length != 0
    b, command, e = next_command(line)
    string += b
    if command
      for i in 0 ... command[:repeat]
        string += command[:arg]
      end
    end
    line = e
  end
  total_length += string.length
end

puts "part1: #{total_length}"


total_length = 0
input.split("\n").each.with_index do |line, i|
  total_length += count_string(line)

end

puts "part2: #{total_length}"



