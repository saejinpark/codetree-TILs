import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func countTensDigitsFormat(counts:[Int]) -> String {
    return counts
                .enumerated()
                .map{ (index, element) in "\(index + 1) - \(element)" }
                .joined(separator: "\n")
}

func getTenNumber(num:Int) -> Int {
    let baseLine = num % 100
    switch baseLine {
        case 0...9:   return -1
        case 10...19: return 1
        case 20...29: return 2
        case 30...39: return 3
        case 40...49: return 4
        case 50...59: return 5
        case 60...69: return 6
        case 70...79: return 7
        case 80...89: return 8
        case 90...99: return 9
        default: return -1
    }
}

func countTensDigits(_ arr:[Int], _ nums:[Int]) -> [Int] {
    var countArr = arr
    var tenNums = nums.map{ $0 |> getTenNumber }.filter{ $0 != -1 }
    tenNums.forEach{ countArr[$0 - 1] += 1 }
    return countArr
}

func solution(_ nums:[Int]) -> String {
    var useNums:[Int] = []
    for num in nums {
        if num == 0 { break }
        useNums.append(num)
    }
    return countTensDigits(Array(repeating: 0, count: 9), useNums) |> countTensDigitsFormat
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()