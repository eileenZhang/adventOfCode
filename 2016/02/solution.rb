
file_name = "input.txt"

input = File.read(file_name)


pos = [1,1]
code = ""
number_pad = [[1,2,3], [4,5,6], [7,8,9]]
input.split("\n").each do |line|
  line.each_char do |c|
    case c
    when "U"
      pos[0] = [0, pos[0] - 1].max
    when "D"
      pos[0] = [2, pos[0] + 1].min
    when "R"
      pos[1] = [2, pos[1] + 1].min
    when "L"
      pos[1] = [0, pos[1] - 1].max
    end
  end
  code += number_pad[pos[0]][pos[1]].to_s
end
puts "part1: #{code}"


pos = [2,0]
code = ""
number_pad = [[nil, nil, '1', nil, nil],
              [nil, '2', '3', '4', nil],
              ['5', '6', '7', '8', '9'],
              [nil, 'A', 'B', 'C', nil],
              [nil, nil, 'D', nil, nil]]

input.split("\n").each do |line|
  line.each_char do |c|
    case c
    when "U"
      tmp = [0, pos[0] - 1].max
      pos[0] = number_pad[tmp][pos[1]] ? tmp : pos[0]
    when "D"
      tmp = [4, pos[0] + 1].min
      pos[0] = number_pad[tmp][pos[1]] ? tmp : pos[0]
    when "R"
      tmp = [4, pos[1] + 1].min
      pos[1] = number_pad[pos[0]][tmp] ? tmp : pos[1]
    when "L"
      tmp = [0, pos[1] - 1].max
      pos[1] = number_pad[pos[0]][tmp] ? tmp : pos[1]
    end
    
  end
  code += number_pad[pos[0]][pos[1]]
end
puts "part2: #{code}"
