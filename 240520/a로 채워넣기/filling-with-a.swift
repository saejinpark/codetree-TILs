import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String) -> String {
    return Array(str)
                .enumerated()
                .map{(index, elem) in
                    index == 1 || index == str.count - 2
                    ?  "a"
                    : String(elem)
                }
                .joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()