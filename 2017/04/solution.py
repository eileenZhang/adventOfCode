

# def solution(function):
#     passwords = open("input.txt").read().split("\n")
#     count = 0
#     for password in passwords:
#         line = password.split(" ")
#         dup = set()
#         valid = True
#         for word in line:
#             new_word = function(word)
#             if new_word in dup:
#                 valid = False
#             else: 
#                 dup.add(new_word)
#         if valid:
#             count += 1
#     return count
           
# print "part1:", solution(lambda string: string)
# print "part1:", solution(lambda string: "".join(sorted(string)))


fin = open("input.txt").read().split("\n").map(int)