
def check_pair(string)
  check = {}
  pair = false
  for i in 0 ... string.length
    c = string[i .. i+1]
    if check[c] == i - 1
      next
    end
    if not check[c]
      check[c] = i
    else 
      pair = true
    end
  end
  pair
end


def check_repeat(string)
  check = {}
  repeat = false
  for i in 0 ... string.length - 2
    if string[i] == string[i+2]
      repeat = true
      break
    end
  end
  repeat
end



nice = 0
file_name = "input.txt"
File.open(file_name, "r") do |f|

  f.each_line do |line|
    if check_pair(line) && check_repeat(line)
      nice += 1
  	end 
  end
end

puts "#{nice}"
