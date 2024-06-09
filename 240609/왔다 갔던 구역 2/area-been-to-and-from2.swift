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
    var coordDict: [String: Int] = [:]
    var (start, end, current) = (0, 0, 0)
    for (num, command) in arrows {
        switch command {
        case "L":
            for i in 1...num {
                coordDict["\(current - 1) \(current)", default: 0] += 1
                current -= 1
                start = current < start ? current : start
            }
        case "R":
            for i in 1...num {
                coordDict["\(current) \(current + 1)", default: 0] += 1
                current += 1
                end = end < current ? current : end
            }
        default:
            return -1
        }
    }

    var answer = 0

    for i in start..<end {
        let stack = (coordDict["\(i) \(i + 1)"] ?? 0)
        answer = stack >= 2 ? answer + 1 : answer
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    let arrows = (1...n).compactMap({_ in readArrow()})
    print((n, arrows) |> solution)
}

main()