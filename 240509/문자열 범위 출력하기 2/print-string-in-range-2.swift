import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(component:(String, Int)) -> String {
    let (line, n) = component
    let reversedLine = line.split(separator:"").reversed().joined(separator:"")
    if n >= line.count {
        return reversedLine
    }
    return String(reversedLine[...line.index(reversedLine.startIndex, offsetBy: n - 1)])
}

func main() {
    if let line = readLine(), let n = readNum() {
        print((line, n) |> solution)
    }
}

main()