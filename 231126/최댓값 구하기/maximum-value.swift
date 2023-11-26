import Foundation

print({
    let nums = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
    return nums[0]
}())