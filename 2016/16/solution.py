

num = '11101000110010100'
length = 272

def checksum(string):
    while len(string) % 2 == 0:
        check_sum_string = ""
        for i in range(0, len(string), 2):
            if string[i] == string[i + 1]:
                check_sum_string += "1"
            else:
                check_sum_string += "0"
        string = check_sum_string
    return string

def getData(string, length):
    while len(string) < length:
        temp = string[::-1]
        temp = temp.replace("0", "#")
        temp = temp.replace("1", "0")
        b = temp.replace("#", "1")
        string += "0" + b
    return string[0:length]

print "part1:", checksum(getData(num, length))
length = 35651584
print "part2:", checksum(getData(num, length))

