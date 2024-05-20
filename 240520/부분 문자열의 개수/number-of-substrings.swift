import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> Int {
    let (line, base) = component
    var cnt = 0
    let lineArr = Array(line).map{String($0)}
    let baseArr = Array(base).map{String($0)}
    for i in 0...(lineArr.count - baseArr.count) {
        var testCase = true
        for j in 0..<base.count {
            if lineArr[i + j] != baseArr[j] {
                testCase = false
                break
            }
        }
        cnt = testCase ? cnt + 1 : cnt
    }
    return cnt
}

func main() {
    if let line = readLine(), let base = readLine() {
        print((line, base) |> solution)
    }
}

main()