min_presents = 36000000
# 2683


def add(num, elf_num, other_elf, giftsPerVisit)
  if num && other_elf/elf_num > num
    return 0
  end
  return elf_num * giftsPerVisit
end

def count_presents(house_num, house_per_elf, present_per_house)
  present = 0
  max_num = (house_num ** 0.5).to_i 
  (1 .. max_num).each do |elf_num|
    if house_per_elf
      if elf_num > house_per_elf
        return present * present_per_house
      end
      if house_num % elf_num == 0  
        other_elf = house_num/elf_num
        if other_elf <= house_per_elf
          present += elf_num
        end
        if elf_num != other_elf
          present += other_elf
        end
      end

    else
      if house_num % elf_num == 0 
        present += elf_num 
        if elf_num != house_num/elf_num
          present += (house_num/elf_num)
        end
      end
    end
  end
  present * present_per_house
end

house_num = 1
house1 = nil
house2 = nil
while true  
  present1 = nil
  present2 = nil
  unless house1
    present1 = count_presents(house_num, nil, 10)
    if present1 >= min_presents
      house1 = house_num
    end
  end
  unless house2
    present2 = count_presents(house_num, 50, 11)
    if present2 >= min_presents
      house2 = house_num
    end
  end

  if house_num % 10000 == 0
    puts "house #{house_num}: #{present1}, #{present2}"
  end
  if house1 && house2
    break
  end
  house_num += 1
end

puts "part1: #{house1}"
puts "part2: #{house2}"

# puts count_presents(856800, 50, 11)

