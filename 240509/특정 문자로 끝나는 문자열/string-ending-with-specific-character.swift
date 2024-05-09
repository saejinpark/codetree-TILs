import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, [String])) -> String{
    let (base, strs) = component
    let filteredStrs = strs.filter{str in
        if let last = str.last {
            return String(last) == base
        }
        return false
    }
    if filteredStrs.count == 0 {
        return "None"
    }
    return filteredStrs.joined(separator: "\n")
}

func main() {
    let strs = (1...10).compactMap({_ in readLine()})
    if strs.count == 10, let base = readLine(), base.count == 1 {
        print((base, strs) |> solution)
    }
}

main()