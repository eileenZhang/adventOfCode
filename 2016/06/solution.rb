
file_name = "input.txt"

input = File.read(file_name)
words = input.split("\n")
length = words[0].length
letters = []
words.each do |w|
  w.each_char.with_index do |c, i|
    letters[i] ||= {}
    letters[i][c] ||= 0
    letters[i][c] += 1
  end
end

secret = ""
letters.each.with_index do |d, index|
  d = d.sort_by {|k, v| v}.reverse
  secret += d[0][0]
end

puts "part1: #{secret}"

secret = ""
letters.each.with_index do |d, index|
  d = d.sort_by {|k, v| v}
  secret += d[0][0]
end
puts "part1: #{secret}"
