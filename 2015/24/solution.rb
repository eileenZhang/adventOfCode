
file_name = 'input.txt'


input = File.read(file_name).split("\n")


def subset_sum(amount_left, weights_left, weights_so_far)
  if amount_left == 0
    return [weights_so_far]
  end
  if amount_left < 0
    return [nil]
  end
  puts "ammount_left: #{amount_left}"
  amounts = []
  weights_left.each.with_index do |w, i|
    amounts += subset_sum(amount_left - w, weights_left[i + 1 ... weights_left.size] , weights_so_far + [w])
  end
  amounts.compact
end

def groups(weight_per_group, group_num, weights, i, so_far)
  puts "i: #{i}"
  if group_num == i
    return [so_far]
  end
  group = subset_sum(weight_per_group, weights.clone, [])
  winners = []
  group.each do |g|
    s = so_far.clone << g
    possible = groups(weight_per_group, group_num, weights - g, i + 1, s)
    if possible[1] != possible[2]
      winners << possible
    end
  end
  winners.compact
end


def solution(weights, group_num)
  total_sum = weights.inject(0, :+)
  weight_per_group = total_sum / group_num
  # winners = groups(weight_per_group, group_num, weights, 0, [])
  winners = subset_sum(weight_per_group, weights.clone, [])
  # min_presents = winners.sort_by { |e| e[0].length }[0][0].length
  min_presents = winners.sort_by { |e| e.length }[0].length
  quantum_entanglement = []
  winners.each do |w|
    if w.length == min_presents
      quantum_entanglement << w.reduce(1, :*)
    end
  end
  quantum_entanglement.min
end

weights = []

input.each do |w|
  weights << w.to_i
end

s = solution(weights, 4)
puts s

