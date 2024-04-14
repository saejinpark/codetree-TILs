import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let int = Int(line)
    else {return nil}
    return int
}

func intToAscii(n: Int) -> String? {
    guard let unicode = UnicodeScalar(n)
    else {return nil}
    return String(unicode)
}

let genUpperAlpha = {
    var num = 65
    return {
        defer {num = num == 90 ? 65: num + 1}
        return intToAscii(n: num)!
    }
}()

func genSpace(n: Int) -> String {
    if n == 0 { return "" }
    return String(repeating: " ", count: n * 2 - 1)
}

func solution(n: Int) -> String {

    return (1...n).map{
        let space = ($0 - 1) |> genSpace
        let line = (1...(n - $0 + 1)).map{
            _ in genUpperAlpha()
        }.joined(separator: " ")
        return space == "" ? line : space + " " + line
    }.joined(separator: "\n")
}

func main() {
    if let n = readInt() {
        print(n |> solution)
    }
}

main()