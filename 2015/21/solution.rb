
def winner(boss, player)
  turn = :player
  while true
    if turn == :player
      boss[:hp] -= (player[:attack] - boss[:defense])
      turn = :boss
    else
      player[:hp] -= (boss[:attack] - player[:defense])
      turn = :player
    end
    if player[:hp] <= 0
      return :boss
    end
    if boss[:hp] <= 0
      return :player
    end   
  end
end

def buy_one(length)
  possible = []
  a = Array.new(length, 0)
  length.times do |i|
    b = a.clone
    b[i] = 1
    possible << b
  end
  possible
end

def get_possible_rings()
  a = [0, 0, 0, 0, 0, 0]
  possible = [a.clone] + buy_one(6)
  a.size.times do |i|
    (i + 1 ... a.size).each do |j|
      b = a.clone
      b[i] = 1
      b[j] = 1
      possible << b
    end
  end
  possible
end

def calculate_score(weapon, armor, ring) 
  rings = [
    {cost: 25, damage: 1, armor: 0},
    {cost: 50, damage: 2, armor: 0},
    {cost: 100, damage: 3, armor: 0},
    {cost: 20, damage: 0, armor: 1},
    {cost: 40, damage: 0, armor: 2},
    {cost: 80, damage: 0, armor: 3}
  ]

  weapons = [
    { cost:  8, damage: 4, armor: 0 }, 
    { cost: 10, damage: 5, armor: 0 }, 
    { cost: 25, damage: 6, armor: 0 }, 
    { cost: 40, damage: 7, armor: 0 }, 
    { cost: 74, damage: 8, armor: 0 }
  ]

  armors = [
    {cost: 0, damage: 0, armor: 0},
    {cost: 13, damage: 0, armor: 1},
    {cost: 31, damage: 0, armor: 2},
    {cost: 53, damage: 0, armor: 3},
    {cost: 75, damage: 0, armor: 4},
    {cost: 102, damage: 0, armor: 5}
  ]
  player = {hp: 100, attack: 0, defense: 0, cost:0}
  w = weapons[weapon.find_index(1)]
  player[:attack] += w[:damage]
  player[:defense] += w[:armor]
  player[:cost] += w[:cost]

  a = armors[armor.find_index(1)]
  player[:attack] += a[:damage]
  player[:defense] += a[:armor]
  player[:cost] += a[:cost]

  ring.each.with_index do |r, index|
    if r == 1
      player[:attack] += rings[index][:damage]
      player[:defense] += rings[index][:armor]
      player[:cost] += rings[index][:cost]
    end
  end
  player
end

def solution(boss, min_gold) 
  win = []
  lose = []
  possible_ring = get_possible_rings()
  possible_weapon = buy_one(5)
  possbile_armor = buy_one(6)
  possible_weapon.each do |w|
    possbile_armor.each do |a|
      possible_ring.each do |r|
        player = calculate_score(w, a, r)
        before = player.clone        
        if winner(boss.clone, player) == :player
          win << player[:cost]
        else
          lose << player[:cost]
        end
      end
    end
  end
  if min_gold
    return win.min
  else
    return lose.max
  end
end

boss = {hp: 109, attack: 8, defense: 2}


puts "part1: #{solution(boss, true)}"
puts "part2: #{solution(boss, false)}"

