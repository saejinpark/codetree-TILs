import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func isCarry(nums: [Int]) -> Bool {
    var currentNums = nums

    while !currentNums.isEmpty {
        var sum = 0
        var nextNums : [Int] = []
        for i in 0..<currentNums.count {
            sum += currentNums[i] % 10
            let testCase = currentNums[i] / 10
            if testCase != 0 {
                nextNums.append(testCase)
            }
        }
        if sum >= 10 {
            return true
        }
        currentNums = nextNums
    }

    return false
}

func solution(component: (Int, [Int])) -> Int {
    let (n, nums) = component
    var answer = -1
    for i in 0..<(n - 2) {
        for j in (i + 1)..<(n - 1) {
            for k in (j + 1)..<n {
                let first = nums[i]
                let second = nums[j]
                let third = nums[k]

                if isCarry(nums: [first, second, third]) {
                    continue 
                }
                let testCase = first + second + third
                answer = answer > testCase ? answer : testCase
            }
        }
    }
    return answer
}

func main() {
    guard let n = readNum() else { return }
    let nums = (1...n).compactMap({_ in readNum()})
    print((n, nums) |> solution)
}

main()