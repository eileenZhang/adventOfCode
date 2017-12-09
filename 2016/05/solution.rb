require 'digest'


i = 0

key = "uqwqemis"
md5 = Digest::MD5.new

# password = ''
# while true do
#   md5 = Digest::MD5.new
#   word = key + i.to_s
#   md5 << word  

#   hash_text = md5.hexdigest
#   if hash_text[0..4] == "00000"
#     password += hash_text[5]
#     if password.length == 8
#       break
#     end
#   end
#   i += 1
# end
# puts "part1: #{password}"

# 694190c

password = []
filled = 0
while true do
  md5 = Digest::MD5.new
  word = key + i.to_s
  md5 << word  

  hash_text = md5.hexdigest
  if hash_text[0..4] == "00000"
    index = hash_text[5].to_i
    if (index > 7 || index.to_s != hash_text[5].to_s) || (password[index] != nil)
      i+= 1
      next
    end
    puts filled
    puts "index: #{index}, #{hash_text[6]}"
    password[index] = hash_text[6]
    filled += 1
    if filled == 8
      break
    end
  end
  i += 1
end

puts "part2: #{password.join}"
