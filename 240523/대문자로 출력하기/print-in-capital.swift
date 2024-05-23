import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function: (T) -> U) -> U {
    return function(value)
}

let lowerAlphaStr = "abcdefghijklmnopqrstuvwxyz"
let upperAlphaStr = lowerAlphaStr.uppercased()
let alphas = Array(lowerAlphaStr + upperAlphaStr).map(String.init)


func solution(line: String) -> String {
    var answer = ""
    for i in line.split(separator: "").map(String.init) {
        if alphas.contains(i) {
            answer += i.uppercased()
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