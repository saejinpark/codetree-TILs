import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str: String) -> String {
    return Array(str).map{$0.isUppercase ? String($0).lowercased() : String($0).uppercased()
    }.joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()