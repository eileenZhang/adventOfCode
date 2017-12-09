
def solution(row, col, inital_code)
  i = 2
  j = 1
  pre_code = inital_code
  while i < row || j < col 
    if i == 0
      i = j
      j = 1
    end
    pre_code = pre_code * 252533 % 33554393

    i -= 1
    j += 1
  end
  pre_code = pre_code * 252533 % 33554393
  pre_code
end

inital_code = 20151125
row = 3010
column = 3019
puts solution(row, column, inital_code)
