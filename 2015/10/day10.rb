input = 3113322113.to_s


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


for i in 0 ... 50
  puts "#{i}"
  new_string = ""
  while input.length != 0 do
    count, num = count_consecutive(input)
    new_string += count.to_s + num.to_s
    input = input[count .. input.length]
  end

  input = new_string

end


puts "part1: #{input.length}"

