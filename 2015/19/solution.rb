require 'set'
file_name = 'input.txt'

$VISITED = {}

def replace(word, replacements)
  molecules = Set.new
  word.each_char.with_index do |c, index|
    changes = replacements[c.to_sym]
    if changes
      pre = word[0...index] ? word[0...index] : ''
      post = word[index + 1...word.length] ? word[index + 1...word.length] :''
      changes = replacements[c.to_sym]
      changes.each do |d|
        new_word = pre + d + post
        if new_word && (new_word.size <= $WORD.length) && !$VISITED.include?(new_word)
          molecules.add(new_word)
          $visited[new_word] = true
        end
      end
    end

    if index + 1 < word.size
      changes = replacements[word[index..index + 1].to_sym]
      if changes
        pre = word[0...index] ? word[0...index] : ''
        post = word[index + 1..word.length] ? word[index + 1..word.length]: ''
        changes.each do |d|
          new_word = pre + d + post
          if new_word && new_word.size <= $WORD.length && !$VISITED.include?(new_word)
            molecules.add(new_word)
            $visited[new_word] = true
          end
        end
      end
    end
  end
  molecules
end

def replacement

def reduce(word, possible_replacements, steps)
  puts "steps!! #{steps}"
  puts "length #{word.length}"
  # puts "word!! #{word}"
  if word == 'e'
    # puts "steps #{steps}"
    return steps
  end
  if word.include? 'e'
    return nil
  end
  word_length = word.length
  i = word_length
  word.reverse.each_char.with_index do |c, i|
    puts "i: #{word_length - i - 1}"
    possible_replacements.each do |lst|
      key = lst[0]
      value = lst[1]
      len = key.length
      if word_length < len
        next
      end
  
      n = word_length - i
      if n - len > n
        next
      end
      puts "check: #{word[n - len ... n]}: #{key}"
      if word[n - len ... n] == key
        new_word = word[0 ... word_length - len ] + value
        puts "new_word #{new_word}"
        solution = reduce(new_word, possible_replacements, steps + 1)
        if solution
          return solution
        end
      end
    end
  end
  puts "return nil"
  nil
end

word = 'CRnSiRnCaPTiMgYCaPTiRnFArSiThFArCaSiThSiThPBCaCaSiRnSiRnTiTiMgArPBCaPMgYPTiRnFArFArCaSiRnBPMgArPRnCaPTiRnFArCaSiThCaCaFArPBCaCaPTiTiRnFArCaSiRnSiAlYSiThRnFArArCaSiRnBFArCaCaSiRnSiThCaCaCaFYCaPTiBCaSiThCaSiThPMgArSiRnCaPBFYCaCaFArCaCaCaCaSiThCaSiRnPRnFArPBSiThPRnFArSiRnMgArCaFYFArCaSiRnSiAlArTiTiTiTiTiTiTiRnPMgArPTiTiTiBSiRnSiAlArTiTiRnPMgArCaFYBPBPTiRnSiRnMgArSiThCaFArCaSiThFArPRnFArCaSiRnTiBSiThSiRnSiAlYCaFArPRnFArSiThCaFArCaCaSiThCaCaCaSiRnPRnCaFArFYPMgArCaPBCaPBSiRnFYPBCaFArCaSiAl'
replacements = {}
possible = {}
part1 = 0
File.open(file_name, 'r') do |f|
  f.each_line do |line|
    a, b = line.split(' => ')
    replacements[a.strip] ||= []
    replacements[a.strip] << b.strip
    possible[b.strip] = a
  end
end
# molecules = replace(word, replacements)
# part1 = molecules.to_a.size
# puts "part1: #{part1}"
possible = possible.sort_by { |key, value| key.length }.reverse
print possible
puts
part2 = reduce(word, possible, 0)
puts "part2: #{part2}"
