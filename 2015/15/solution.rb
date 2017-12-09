
file_name = "input.txt"
def parse(line)
  lst = line.split(":")
  name = lst[0].to_sym
  properties_list = {}
  properties = lst[1].split(",")
  properties.each do |i|
    property = i.split(" ")
    property_name = property[0].strip.to_sym
    value = property[1].strip.to_i
    properties_list[property_name] = value
  end
  [name, properties_list]
end


def find_max_score(ingredient_left, total, ingredient_info, so_far, lst)
  if ingredient_left.size == 1
    so_far[ingredient_left[0]] = 100 - total

    score = calculate_score(so_far, ingredient_info)[0]
    return score
  end
  scores = []
  ingredient = ingredient_left.shift
  for j in 0 .. (100 - total)
    so_far_tmp = so_far.clone
    so_far_tmp[ingredient] = j
    scores << find_max_score(ingredient_left.clone, j + total, ingredient_info, so_far_tmp, lst + [ingredient])
  end
  scores.max
end

def calculate_score(ratio, ingredients)
  score = {:capacity => 0, :durability => 0, :flavor => 0, :texture => 0, :calories => 0}
  ratio.each do |ing, value|
    score[:capacity] += value * ingredients[ing][:capacity]
    score[:durability] += value * ingredients[ing][:durability]
    score[:flavor] += value * ingredients[ing][:flavor]
    score[:texture] += value * ingredients[ing][:texture]
    score[:calories] += value * ingredients[ing][:calories]
  end
  [[score[:capacity], 0].max * [score[:durability], 0].max * [score[:flavor], 0].max * [score[:texture], 0].max,
  score[:calories]]

end

def find_score_500c(ingredient_left, total, ingredient_info, so_far, lst)
  if ingredient_left.size == 1
    so_far[ingredient_left[0]] = 100 - total

    score, calories = calculate_score(so_far, ingredient_info)
    if calories != 500
      return 0
    end
    return score
  end
  scores = []
  ingredient = ingredient_left.shift
  for j in 0 .. (100 - total)
    so_far_tmp = so_far.clone
    so_far_tmp[ingredient] = j
    scores << find_score_500c(ingredient_left.clone, j + total, ingredient_info, so_far_tmp, lst + [ingredient])
  end
  scores.max
end

ingredients = {}
ingredient_names = []
max_score = 0
File.open(file_name, "r") do |f|
  f.each_line do |line|
    name, properties_list = parse(line)
    ingredients[name] = properties_list
  end
  
end

max_score = find_max_score(ingredients.keys.clone, 0, ingredients, {}, [])
puts "part1: #{max_score}"

max_score = find_score_500c(ingredients.keys.clone, 0, ingredients, {}, [])
puts "part2: #{max_score}"
