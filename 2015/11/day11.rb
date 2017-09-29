password = "hepxcrrq"

def to_base26int(num)
    num.tr( "abcdefghijklmnopqrstuvwxyz", "0123456789abcdefghijklmnopq" ).to_i(26)
end 

def to_string(string)
    string.to_s(26).tr( "0123456789abcdefghijklmnopq", "abcdefghijklmnopqrstuvwxyz" )
end 

def increment(password)
    num = to_base26int(password) + 1
    to_string(num)
end

def increment_letter(let)
    if let == 'z' ||  let == nil
        return nil
    else
        return (let.ord + 1).chr
    end
end

def increasing_letter_check(password)
    check = false
    password.each_char.with_index do |char, index|
        next_let = increment_letter(char)
        if password[index + 1] == next_let
            next_let = increment_letter(next_let)
            if next_let != nil && password[index + 2] == next_let
                check = true
                break
            end
        end
    end
    check
end

def two_pairs(password)
    count = 0
    pairs = []
    password.each_char.with_index do |char, index|

        if password[index + 1] == char 
            unless pairs.include? char
                count += 1
                pairs << char
            end
        end
    end
    count >= 2
end

def vaild_password(password)
    if password.include?("i") || password.include?("o") || password.include?("l")
        return false
    end
    unless increasing_letter_check(password) 
        return false
    end
    unless two_pairs(password)
        return false
    end
    true
end

def find_next(password)
    while true do
        password = increment(password)
        if vaild_password(password)
            break
        end
        
    end
    password
end


# password1 = find_next(password)
password2 = find_next("hepxxyzz")
# puts "part1: #{password1}"
puts "part2: #{password2}"