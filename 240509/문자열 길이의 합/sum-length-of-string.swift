import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(strs:[String]) -> String {
    var len = 0
    var cnt = 0
    for str in strs {
        len += str.count
        if str[str.startIndex] == "a" {
            cnt += 1
        }
    }
    return "\(len) \(cnt)"
}

func main() {
    if let num = readNum() {
        let strs = (1...num).compactMap({_ in readLine()})
        print(strs |> solution)
    }
}

main()