import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}


func solution(line:String) -> String {
    return line
            .split(separator: " ")
            .enumerated()
            .filter{(index, _) in index % 2 == 0}
            .map{(_, elem) in elem}
            .joined(separator: "\n")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()