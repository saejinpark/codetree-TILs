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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1]) 
}

func solution(_ component: (Int, [(Int, Int)])) -> Int {
    let (n, input) = component
    var answer = 0

    for i in 0..<n {
        var target = input[i]
        var pivot = true
        for j in 0..<n {
            if i == j { continue }

            let testCase = input[j]

            if (target.0 > testCase.0 && target.1 < testCase.1)
            || (target.0 < testCase.0 && target.1 > testCase.1) {
                pivot = false
            }

            if !pivot { break }

        }

        if pivot { answer += 1 }
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    let input = (1...n).compactMap({ _ in readNumPair() })
    print(solution((n, input)))
}

main()