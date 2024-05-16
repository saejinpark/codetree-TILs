import Foundation

precedencegroup ForwardPipe {
    associativity : left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(component:(Int, [String])) -> String {
    let (n, strs) = component
    var answer = ""
    for i in 0..<n {
        answer += strs[i]
    }
    return answer
}

func main() {
    if let n = readNum() {
        let strs = (1...n).compactMap({_ in readLine()})
        if strs.count != n { return }
        print((n, strs) |> solution)
    }
}

main()