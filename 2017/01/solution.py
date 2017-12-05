

fin = open("input.txt").read()


def solution(nums, steps):
    ans = 0
    for i in range(0, len(nums)):
        if nums[i] == nums[(i + steps) % len(nums)]:
            ans += int(nums[i])
    return ans
# for i in range(steps):
#     j = len(fin) - steps - 1
#     ans += int(fin[j])
print "part2:", solution(fin, 1)
print "part2:", solution(fin, len(fin)/2)