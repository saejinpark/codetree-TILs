import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNKT() -> (Int, Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.count != 3 { return nil }
    guard let n = Int(temp[0]), let k = Int(temp[1]) else { return nil }
    return (n, k, String(temp[2]))
}

func solution(component: (Int, Int, String, [String])) -> String {
    let (n, k, t, strs) = component
    return strs.filter{$0[..<$0.index($0.startIndex, offsetBy: t.count)] == t}.sorted()[k - 1]
}

func main() {
    guard let input = readNKT() else { return }
    let (n, k, t) = input
    let strs = (1...n).compactMap({_ in readLine()})
    if strs.count != n { return }
    print((n, k, t, strs) |> solution)
}

main()