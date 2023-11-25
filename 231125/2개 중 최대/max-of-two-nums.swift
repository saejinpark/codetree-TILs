import Foundation

let max = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return nums[0] > nums[1] ? nums[0] : nums[1]
}()

print(max)