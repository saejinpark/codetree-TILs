import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.allSatisfy({Int($0) != nil}) {
        return temp.map{Int($0)!}
    }
    return nil
}

func solution(_ nums: [Int]) -> String {
    var validNums: [Int] = []
    for i in nums {
        if i >= 250 {
            break
        }
        validNums.append(i)
    }
    let sum = validNums.reduce(0, +)
    let average = Float(sum) / Float(validNums.count)
    let formattedAvg = String(format: "%.1f", average) // "%.1f"는 소수점 한 자리까지 반올림


    return "\(sum) \(formattedAvg)"
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}


main()