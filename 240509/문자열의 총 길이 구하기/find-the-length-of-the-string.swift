import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(line:String) -> Int {
    return line.split(separator: " ").reduce(0){$0 + $1.count}
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()