import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(strs:[String]) -> String {
    return strs.reversed().joined(separator:"\n")
}

func main() {
    let strs = (1...4).compactMap({_ in readLine()})
    if strs.count == 4 {
        print(strs |> solution)
    }
}

main()