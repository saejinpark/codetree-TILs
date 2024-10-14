import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else {return nil}
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap({Int($0)})
    return nums
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func genDistance(p1: (Int, Int), p2: (Int, Int)) -> Int {
    return (p1.0 - p2.0) * (p1.0 - p2.0) + (p1.1 - p2.1) * (p1.1 - p2.1)
}

func solution(_ input: [(Int, Int)]) -> Int {
    var answer = Int.max

    for i in 0..<(input.count - 1) {
        let first = input[i]
        for j in (i + 1)..<input.count {
            let second = input[j]
            answer = min(answer, genDistance(p1: first, p2: second))
        }
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    let input = (1...n).compactMap({_ in readNumPair()})
    print(solution(input))
}

main()