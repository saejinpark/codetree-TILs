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
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(component: (Int, Int, [Int])) -> Int {
    let (n, k, nums) = component

    var answer = 0

    for i in k...n {
        var testCase = 0
        for j in (i - k)..<i {
            testCase += nums[j]
        }
        answer = testCase > answer ? testCase : answer 
    }

    return answer
}

func main() {
    guard let (n, k) = readNumPair(), let nums = readNums() else { return }
    print((n, k, nums) |> solution)
}

main()