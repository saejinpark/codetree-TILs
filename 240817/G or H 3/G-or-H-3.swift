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

func readIndexAndAlpha() -> (Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.count != 2 { return nil }
    if let index = Int(temp[0]) {
        return (index, String(temp[1]))
    }
    return nil
}

func solution(component: (Int, Int, [(Int, String)])) -> Int {
    let (n, k, arr) = component
    var limit = -1
    for (i, _) in arr {
        limit = [i, limit].max()!
    }
    var row = Array(repeating: 0, count: limit)
    for (i, s) in arr {
        switch s {
            case "G":
                row[i - 1] = 1
            case "H":
                row[i - 1] = 2
            default:
                row[i - 1] = 0
        }
    }

    var answer = -1
    for i in k..<limit {
        let testCase = ((i - k)...i).map{row[$0]}.reduce(0, +)
        answer = [answer, testCase].max()!
    }

    return answer
}

func main() {
    guard let (n, k) = readNumPair() else { return }
    let arr = (1...n).compactMap({_ in readIndexAndAlpha()})

    print((n, k, arr) |> solution)
}

main()