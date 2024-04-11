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
    return (1...n).map{ i in
        (1...i).map{
            String($0 * i)
        }.joined(separator: " ")
    }.joined(separator: "\n")
}

func main() {
    guard let n = input()
    else {
        return
    }
    print(solution(n))
}

main()