import Foundation

let (a, b, c) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1], nums[2])
}()

print(a < b && b < c ? 1 : 0)