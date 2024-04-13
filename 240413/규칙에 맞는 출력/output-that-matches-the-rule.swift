import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else {
        return nil
    }
    return num
}

func genLine(_ arr: [Int]) -> String {
    return arr.map{String($0)}.joined(separator: " ")
}

func solution(_ n: Int) -> String {
    return stride(from: n, to: 0, by: -1)
        .map { Array($0...n) |> genLine }
        .joined(separator: "\n")
}


func main() {
    if let n = input() {
        print(solution(n))
    }
}

main()