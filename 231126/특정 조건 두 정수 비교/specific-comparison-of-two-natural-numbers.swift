import Foundation

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

print(a < b ? 1 : 0, a == b ? 1 : 0)