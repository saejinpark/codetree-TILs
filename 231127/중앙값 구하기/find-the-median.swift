import Foundation

var (a, b, c) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1], nums[2])
}()

if a > b {
    (a, b) = (b, a)
}

if b > c {
    (b, c) = (c, b)
}

if a > b {
    (a, b) = (b, a)
}

print(b)