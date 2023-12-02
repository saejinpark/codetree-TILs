import Foundation

let sum = {(nums: [Int]) -> Int in nums.reduce(0, +)}
let avg = {(nums: [Int]) -> Float in round(Float(sum(nums)) / Float(nums.count) * 100) / 100 }

func solution() -> String {
    var ages = [Int]()
    while true {
        let age = Int(readLine()!.trimmingCharacters(in: [" "]))!

        switch age {
            case 20...29:
                ages.append(age)
                break
            default:
                return String(format: "%.2f", avg(ages))
        }
    }
}


let answer = solution()

print(answer)