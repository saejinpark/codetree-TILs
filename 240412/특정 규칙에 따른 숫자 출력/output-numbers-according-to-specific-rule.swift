import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let result = Int(line)
    else {
        return nil
    }
    return result
}

let genNum = {
    var num = 1
    return {
        defer {
            num = num == 9 ? 1 : num + 1
        }

        return String(num)
    }
}()

func genLine(_ n: Int) -> String {
    if n == 0 {
        return ""
    }
    return (1...n).map{_ in genNum()}.joined(separator: " ")
}

func genSpace(_ n: Int) -> String {
    return String(repeating: "  ", count: n)
}

func solution(_ n: Int) -> String {
    return (0..<n).map{
        genSpace($0) + genLine(n - $0)
    }.joined(separator: "\n")
}

func main() {
    if let n = input() {
        print(solution(n))
    }
}

main()