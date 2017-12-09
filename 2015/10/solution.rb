input = '3113322113'

def count_consecutive(n)
  letter = n[0]
  c = 1
  while c < n.length do
    if n[c] != letter
      break
    end
    c += 1
  end
  [c, letter]
end

part1 = 0
50.times do |i|
  puts i
  new_string = ''
  while input.length != 0 do
    count, num = count_consecutive(input)
    new_string += count.to_s + num.to_s
    input = input[count .. input.length]
  end
  input = new_string
  if i == 40
    part1 = input.length
  end

end


puts "part1: #{part1}"
puts "part2: #{input.length}"

