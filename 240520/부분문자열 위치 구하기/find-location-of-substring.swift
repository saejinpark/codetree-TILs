import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> Int {
    let (str, base) = component
    let strArr = Array(str).map{String($0)}
    let baseArr = Array(base).map{String($0)}
    for i in 0...(strArr.count - baseArr.count) {
        var testCase = true
        for j in 0..<baseArr.count {
            if strArr[i + j] != baseArr[i] {
                testCase = false
                break
            }
        }

        if testCase {
            return i
        }
    }
    return -1
}

func main() {
    if let line = readLine(), let base = readLine() {
        print((line, base) |> solution)
    }
}

main()