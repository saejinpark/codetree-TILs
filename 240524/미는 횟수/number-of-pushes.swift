import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func shift(str: String) -> String {
    var strArr = Array(str).map(String.init)
    strArr.append(strArr.remove(at: 0))
    return strArr.joined(separator: "")
}

func solution(_ line1: String, _ line2: String) -> Int {
    var current = line2
    var cnt = 0
    for i in 0...line1.count {
        if line1 == current {
            return i
        }
        current = (current |> shift)
    }
    return -1
}

func main() {
    guard let line1 = readLine(), let line2 = readLine() else { return }
    print(solution(line1, line2))
}

main()