
file_name = "input.txt"


def parse(line)
  inside = []
  outside = []
  string = ""
  line.each_char do |c|
    if c == "["
      outside << string
      string = ""
      next
    end
    if c == "]"
      inside << string
      string = ""
      next
    end
    string += c
  end
  outside << string
  [outside, inside]
end

def find_ABA(lst)
  aba_lst = []
  lst.each do |string|
    string.each_char.with_index do |c, i|
      if string[i+1] == nil || string[i+2] == nil
          break
      end 
      if c != string[i+1] && c == string[i+2]   
        aba_lst << (string[i+1] + c + string[i+1])
      end
    end
  end
  aba_lst
end

def found_ABBA(lst)
  found = false
  lst.each do |string|
    string.each_char.with_index do |c, i|
      if string[i+1] == nil || string[i+2] == nil || string[i+3] == nil
          break
      end 
      found ||= c != string[i+1] && c + string[i+1] == string[i+3] + string[i+2]   
    end
  end
  found
end
input = File.read(file_name)
count_TLS = 0
input.split("\n").each do |line|
  outside, inside = parse(line)
  if (found_ABBA(outside) || found_ABBA(outside)) && (! found_ABBA(inside))
    count_TLS += 1
  end
end

def find_BAB(aba_lst, word_lst)
  found = false
  word_lst.each do |w|
    aba_lst.each do |a|
      if w.include?(a)
        found = true
      end
    end
  end
  found
end

puts "part1: #{count_TLS}"

input = File.read(file_name)
count_SSL = 0
input.split("\n").each do |line|
  outside, inside = parse(line)
  aba_lst = find_ABA(outside)
  if find_BAB(aba_lst, inside)
    count_SSL += 1
  end
end

puts "part2: #{count_SSL}"

