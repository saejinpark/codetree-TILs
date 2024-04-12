import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function:(T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let result = Int(line)
    else {
        return nil
    }
    return result
}

func genSpace(count: Int) -> String {
    return String(repeating: " ", count: count)
}

func numToLine(_ n: Int) -> String {
    return stride(from: n, to: 0, by: -1).map{String($0)}.joined(separator: " ")
}

func solution(_ n: Int) -> String {
    var answer = ""

    let lineLen = (2 * n) - 1

    answer = stride(from: n, to: 0, by: -1).map{
        let line = numToLine($0)
        let space = genSpace(count: lineLen - line.count)
        return space + line
    }.joined(separator: "\n")

    return answer
}

func main() {
    guard let n = input()
    else {
        return
    }
    let answer = solution(n)
    print(answer)
}

main()