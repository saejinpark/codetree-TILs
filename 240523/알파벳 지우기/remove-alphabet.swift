import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func lineToNum(line: String) -> Int {
    return Int(Array(line).filter{$0.isNumber}.map(String.init).joined(separator: ""))!
}

let solution = {(str1, str2) in
    (str1 |> lineToNum) + (str2 |> lineToNum)
}

func main() {
    if let line1 = readLine(), let line2 = readLine() {
        print((line1, line2) |> solution)
    }
}

main()