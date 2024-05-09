import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else { return nil }
    return num
}

func solution(component:(Int, [String], String)) -> String {
    let (n, strs, base) = component
    let filteredStrs = strs.filter{$0.hasPrefix(base)}
    let sumLen = filteredStrs.reduce(0){$0 + $1.count}
    let avg = Float(sumLen * 100) / Float(filteredStrs.count) / 100
    return "\(filteredStrs.count) \(avg)"
}

func main() {
    if let n = readNum() {
        let strs = (1...n).compactMap({_ in readLine()})
        if strs.count != n { return }
        guard let base = readLine() else { return }

        print((n, strs, base) |> solution)

    }
}

main()