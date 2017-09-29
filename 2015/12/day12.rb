require 'json'

file_name = "input.txt"


def is_number(string)
    return !string.kind_of?(Array) && string.to_i.to_s == string.to_s
end

def has_red(json)
    return json.values.include?("red")

end

def parse(json)
    sum = 0
    if json.class == Array || json.class == Hash
        json.each do |line|
            sum += parse(line)
        end
    elsif is_number(json)
        return json.to_i
    end
    sum

end

def parse_part2(json)
    if json.class == Integer
        return json.to_i
    end
    sum = 0
    if json.class == Array 
        json.each do |line|
            sum += parse_part2(line)
        end
    elsif json.class == Hash
        unless has_red(json)
            json.each do |line|
                sum += parse_part2(line)
            end
        end
    elsif is_number(json)
        sum = json.to_i
    end
    sum

end

File.open(file_name, "r") do |f|
  sum = 0
  f.each_line do |line|
    json_text = JSON.parse(line)
    puts "part1: #{parse(json_text)}"
  end

end

File.open(file_name, "r") do |f|
  sum = 0
  f.each_line do |line|
    json_text = JSON.parse(line)
    puts "part2: #{parse_part2(json_text)}"
  end

end
