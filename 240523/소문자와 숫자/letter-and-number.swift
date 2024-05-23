import Foundation

precedencegroup ForwardPipe {
    associativity : left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function: (T) -> U) -> U {
    return function(value)
}

let lowerAlphaStr = "abcdefghijklmnopqrstuvwxyz"
let upperAlphaStr = lowerAlphaStr.uppercased()
let numStr = "1234567890"
let valiedStrs = Array(lowerAlphaStr + upperAlphaStr + numStr).map(String.init)

func solution(str: String) -> String {
    var answer = ""
    for i in Array(str).map(String.init) {
        if valiedStrs.contains(i) {
            answer += i.lowercased()
        }
    }
    return answer
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()