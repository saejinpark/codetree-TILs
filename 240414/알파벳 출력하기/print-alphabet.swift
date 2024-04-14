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
    else {
        return nil
    }
    return int
}

func intToAscii(_ int: Int) -> String? {
    guard let unicode = UnicodeScalar(int)
    else {
        return nil
    }
    return String(unicode)
}

let genUpperAlpha = {
    var num = 65
    return {
        defer {
            num = num == 90 ? 65: num + 1

        }
        return intToAscii(num)!
    }
}()


func solution(_ n: Int) -> String {
    let _solution = {
        (1...$0).map{_ in genUpperAlpha()}.joined(separator: "")
    }

    return (1...n).map{_solution($0)}.joined(separator: "\n")
}

func main() {
    if let n = readInt() {
        print(solution(n))
    }
}

main()