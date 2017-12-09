


file_name = "input.txt"
def parse(line)
  lst = line.split(" ")
  if lst.size == 6
    value = lst[1].to_i
    bot = lst[-1].to_i
    $robots[bot] ||= []
    $robots[bot] << value
    $total_microchip  += 1
  else
    bot = lst[1].to_i 
    low = [lst[5].to_sym, lst[6].to_i]
    high = [lst[10].to_sym, lst[11].to_i]
    $instructions[bot] = {:high => high, :low => low}
  end

end


def pass(location, num, value)
  $robots[num] ||= []
  if location == :bot
    $robots[num] << value
  else
    $output[num] ||= []
    $output[num] << value
    $total_microchip -= 1
  end

end

input = File.read(file_name)

$robots = []
$instructions = []

total_length = 0
$total_microchip = 0
$output = []
input.split("\n").each do |line|
  parse(line)
end

while $total_microchip != 0
  $robots.each.with_index do |bot, i|
    bot ||= []
    if bot.length >= 2

      bot.sort!
      low_value = bot.shift
      high_value = bot.shift
      if low_value == 17 && high_value == 61
        puts "part1: bot #{i} has chips: #{low_value}, #{high_value}"
      end
      low = $instructions[i][:low]
      high = $instructions[i][:high]
      pass(high[0], high[1], high_value)
      pass(low[0], low[1], low_value)
    end
  end

end


part2 =  $output[0][0] * $output[1][0] * $output[2][0] 
puts "part2: #{part2}"



