import Foundation

var (start, end) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

start = start % 2 == 1 ? start : start + 1

print((stride(from: start, to: end + 1, by: 2)).map{String($0)}.joined(separator: " "))