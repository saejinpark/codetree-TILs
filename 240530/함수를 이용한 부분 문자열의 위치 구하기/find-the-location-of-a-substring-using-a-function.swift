import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(input: (String, String)) -> Int {
    let (str, substr) = input
    let strArr = Array(str).map(String.init)
    let substrArr = Array(substr).map(String.init)
    for i in 0...(strArr.count - substrArr.count) {
        var testCase = true
        for j in 0..<substrArr.count {
            if strArr[i + j] != substrArr[j] {
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
    guard let str = readLine(), let substr = readLine() else { return }
    print((str, substr) |> solution)
}

main()