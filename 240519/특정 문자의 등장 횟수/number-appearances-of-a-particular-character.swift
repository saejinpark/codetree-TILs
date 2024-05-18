import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func counter(component:(String, String)) -> Int {
    let (line, base) = component
    var cnt = 0
    let lineArr = Array(line)
    let baseArr = Array(base)
    for i in 0...(lineArr.count - baseArr.count) {
        var testCase = true
        for j in 0..<baseArr.count {
            if lineArr[i + j] != baseArr[j] {
                testCase = false
                break
            }
        }
        if testCase {
            cnt += 1
        }
    }
    return cnt
}

func solution(line:String) -> String {
    return "\((line, "ee") |> counter) \((line, "eb") |> counter)"
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()