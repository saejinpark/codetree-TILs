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

func readArrow() -> (Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.count == 2, let num = Int(temp[0]) {
        return (num, String(temp[1]))
    }
    return nil
}

func solution(input: (Int, [(Int, String)])) -> Int {
    let (n, arrows) = input
    let constant = 300
    var arr = Array(repeating: 0, count: 600)
    var current = constant
    for (num, dict) in arrows {
        arr[current] += 1
        switch dict {
        case "L":
            for i in 1...num {
                current = current - 1
                arr[current] += 1
            }
        case "R":
            for i in 1...num {
                current = current + 1
                arr[current] += 1
            }
        default:
            return -1
        }
    }

    var count = 0
    for i in 0..<(arr.count - 1) {
        if arr[i] >= 2 && arr[i + 1] >= 2 {
            count += 1
        }
    }
    for i in 1..<arr.count {
        if arr[i - 1] >= 2 && arr[i + 1] >= 2 {
            count += 1
        }
    }

    return count
}

func main() {
    guard let n = readNum() else { return }
    let arrows = (1...n).compactMap({_ in readArrow()})
    print((n, arrows) |> solution)
}

main()