import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let integer = Int(line)
    else {
        return nil
    }
    return integer
}

func padStart(str: String, count: Int) -> String {
    var answer = str
    while answer.count < count {
        answer = " " + answer
    }

    return answer
}

func numToLine(_ n: Int) -> String {
    return stride(from: n, to: 0, by: -1)
        .map{String($0)}
        .joined(separator: " ")
}

func solution(_ n : Int) -> String {
    let lineLen = n + n - 1
    let baseLine = n + 1
    return (1...n).map{
        padStart(str: numToLine(baseLine - $0), count: lineLen)
    }.joined(separator: "\n")
}

func main() {
    if let n = input() {
        print(solution(n))
    }
}

main()