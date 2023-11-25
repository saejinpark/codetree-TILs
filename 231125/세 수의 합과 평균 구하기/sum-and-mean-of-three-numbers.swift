import Foundation

let (a, b, c) = {() -> (Int, Int, Int) in
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1], nums[2])
}()


let sum = {(_ nums : [Int]) -> Int in return nums.reduce(0){$0 + $1}}
let avg = {(_ nums : [Int]) -> Int in return Int(Float(sum(nums)) / Float(nums.count))}

print(sum([a, b, c]))
print(avg([a, b, c]))