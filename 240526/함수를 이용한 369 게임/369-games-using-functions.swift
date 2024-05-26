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
    if temp.count != nums.count { return nil }
    return nums
}

func solution(input: (Int, Int)) -> Int {
    let (a, b) = input
    var cnt = 0
    for i in a...b {
        if i % 3 == 0 {
            cnt += 1
            continue
        }
        var current = i
        while current != 0 {
            let testCase = current % 10
            current /= 10
            if testCase != 0 && testCase % 3 == 0 {
                cnt += 1
                break
            }
        }
    }
    return cnt
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (a, b) = (nums[0], nums[1])
    print((a, b) |> solution)
}

main()