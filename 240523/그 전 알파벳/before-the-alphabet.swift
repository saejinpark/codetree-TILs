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


func solution(alpha: String) -> String {
    if let currentIndex = lowerAlphas.index(of: alpha) {
        return lowerAlphas[(lowerAlphas.count + currentIndex - 1) % lowerAlphas.count]
    }
    return " "
}

func main() {
    if let alpha = readLine() {
        if alpha.count != 1 { return }
        print(alpha |> solution)
    }
}

main()