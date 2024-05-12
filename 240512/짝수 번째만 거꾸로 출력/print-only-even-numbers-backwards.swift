import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(line:String) -> String {
    var answer = ""
    line
        .split(separator:"")
        .map{String($0)}
        .enumerated()
        .forEach{(index, elem) in
            if index % 2 == 1 {
                answer = elem + answer
            }
        }
    return answer
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()