import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(line:String) -> String {
    let strs = line.split(separator: "")
    return strs[2...9].joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()