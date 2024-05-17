import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function:(T) -> U) -> U {
    return function(value)
}

func solution(line:String) -> String {
    return "\(line.contains("ee") ? "Yes" : "No") \(line.contains("ab") ? "Yes" : "No")"
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()