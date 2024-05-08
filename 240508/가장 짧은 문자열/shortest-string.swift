import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U { 
    return function(value)
}



func solution(_ strs:[String]) -> Int {
    let sortedStrs = strs.sorted(by: {$0.count < $1.count})
    return sortedStrs[2].count - sortedStrs[0].count
}

func main() {
    let strs = (1...3).compactMap({_ in readLine()})
    print(strs |> solution)
}

main()