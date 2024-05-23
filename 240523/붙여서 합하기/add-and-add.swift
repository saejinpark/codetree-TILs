import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function: (T) -> U) -> U {
    return function(value)
}

func solution(component: (String, String)) -> Int {
    let (numStr1, numStr2) = component

    if let firstNum = Int(numStr1 + numStr2), let secondNum = Int(numStr2 + numStr1) {
        return firstNum + secondNum
    }

    return -1 
}

func main() {
    if let line = readLine() {
        let numStrs = line.split(separator: " ").map(String.init)
        if numStrs.count != 2 { return }
        print((numStrs[0], numStrs[1]) |> solution)
    }
}

main()