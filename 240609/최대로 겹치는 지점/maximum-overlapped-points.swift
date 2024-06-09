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

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums() else { return nil }
    if nums.count != 2 { return nil }
    return (nums[0], nums[1])
}

func solution(input: (Int, [(Int, Int)])) -> Int {
    let (n, ranges) = input
    var arr = Array(repeating: 0, count: 101)
    for (start, end) in ranges {
        for i in start...end {
            arr[i] += 1
        }
    }
    guard let answer = arr.max() else { return -1 }
    return answer
}

func main() {
    guard let n = readNum() else { return }
    let ranges = (1...n).compactMap({_ in readNumPair()})
    if n != ranges.count { return }
    print((n, ranges) |> solution)
}

main()