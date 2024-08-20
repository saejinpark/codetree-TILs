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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(component: (Int, Int, [Int], [Int])) -> Int {
    let (n, m, nums, baseLine) = component
    var answer = 0
    var sortedBaseLine = baseLine.sorted()
    
    for i in m...nums.count {
        let start = i - m
        let end = start + m
        var testCase = [Int]()
        for i in start..<end {
            testCase.append(nums[i])
        }
        if sortedBaseLine == testCase.sorted() {
            answer += 1
        }
    }

    return answer
}

func main() {
    guard let (n, m) = readNumPair(),
    let nums = readNums(),
    let baseLine = readNums()
    else { return }

    print((n, m, nums, baseLine) |> solution)
}

main()