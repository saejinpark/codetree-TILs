import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function: (T) -> U) -> U {
    return function(value)
}

let lowerAlphaStr = "abcdefghijklmnopqrstuvwxyz"
let lowerAlphas = Array(lowerAlphaStr).map(String.init)

func solution(str: String) -> String {
    if let index = lowerAlphas.index(of: str) {
        return lowerAlphas[(index + 1) % 26]
    }
    return "Error"
}

func main() {
    if let str = readLine() {
        if str.count != 1 { return }
        print(str |> solution)
    }
}

main()