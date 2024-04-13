import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

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



func solution(_ n: Int) -> String {

    return (1...n).map{ first in
        (1...n).map{ second in
            "\(first) * \(second) = \(first * second)"
        }.joined(separator: "\n")
    }.joined(separator: "\n")
}

func main() {
    if let n = input() {
        print(solution(n))
    }
}

main()