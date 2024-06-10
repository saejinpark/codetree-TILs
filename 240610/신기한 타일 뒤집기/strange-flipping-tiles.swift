import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readCommand() -> (Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard let num = Int(temp[0]) else { return nil }
    return (num, String(temp[1]))
}

func solution(input: (Int, [(Int, String)])) -> String {
    let (n, commands) = input
    var offset = 0
    for (num, _) in commands {
        offset += num
    }
    var arr = Array(repeating: 0, count: offset * 2 + 1)
    var current = offset

    for (num, d) in commands {
        switch d {
        case "L":
            arr[current] = 1
            for _ in 1..<num {
                current -= 1
                arr[current] = 1
            }
        case "R":
            arr[current] = 2
            for _ in 1..<num {
                current += 1
                arr[current] = 2
            }
        default:
            return ""
        }
    }

    return "\(arr.filter{$0 == 1}.count) \(arr.filter{$0 == 2}.count)"
}

func main() {
    guard let n = readNum() else { return }
    let commands = (1...n).compactMap({_ in readCommand()})
    print((n, commands) |> solution)
}

main()