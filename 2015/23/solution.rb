
level = 0
file_name = 'input.txt'

def parse(line)
  command = line
  offset = nil

  if line.include? ','
    command, offset = line.split(',')
    offset = offset.to_i
  end
  command, reg = command.split(' ')
  if command == "jmp"
    offset = reg.to_i
    reg = nil
  else
    reg = reg.to_sym
  end

  [command.to_sym, reg, offset]
end

def execute(command, reg, offset)
  case command
  when :hlf
    return [reg / 2, 1]
  when :tpl
    return [reg * 3, 1]
  when :inc
    return [reg + 1, 1]
  when :jmp
    return [reg, offset]
  when :jie
    if reg % 2 == 0
      return [reg, offset]
    end
    return [reg, 1]
  when :jio
    if reg == 1
      return [reg, offset]
    end
    return [reg, 1]
  end

end

def solution(input, register)
  commands = []
  input.each do |line|
    commands << parse(line)
  end
  i = 0
  while true
    c, reg, offset = commands[i]
    value = register[reg]
    new_value, jump = execute(c, value, offset)
    i += jump
    register[reg] = new_value
    if i >= commands.length 
      break
    end
  end
  register[:b]

end

input = File.read(file_name).split("\n")
puts "part1: #{solution(input, {a: 0, b: 0})}"
puts "part2: #{solution(input, {a: 1, b: 0})}"