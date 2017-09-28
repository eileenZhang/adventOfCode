require 'digest'


i = 0

key = "bgvyzdsv"
md5 = Digest::MD5.new


while true do
  md5 = Digest::MD5.new
  word = key + i.to_s
  md5 << word  

  hash_text = md5.hexdigest
  if hash_text[0..4] == "00000"
    break
  end
  i += 1
end
puts "part1: #{i}"


while true do
  md5 = Digest::MD5.new
  word = key + i.to_s
  md5 << word  

  hash_text = md5.hexdigest
  if hash_text[0..5] == "000000"
    break
  end
  i += 1
end
puts "part2: #{i}"
