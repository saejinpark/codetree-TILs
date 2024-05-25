import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let genNum = {
    var num = 1
    return {
        defer {
            num = num != 9 ? num + 1 : 1
        }
        return num
    }

}()

func solution(n: Int) -> String {
    return Array(repeating:0, count: n).map{_ in Array(repeating: 0, count: n).map{_ in String(genNum())}.joined(separator: " ")}.joined(separator: "\n")
}

func main() {
    guard let line = readLine(), let n = Int(line) else { return }
    print(n |> solution)
}

main()