import Foundation

let nums = {return readLine()!.split(separator: " ").map{Int($0)!}}()

let sum = {(_ arr : [Int]) -> Int in
    return arr.reduce(0){$0 + $1}
}
let arg = {(_ arr : [Int]) -> Float in
    return Float(sum(arr)) / Float(arr.count)
}

print(sum(nums), arg(nums))