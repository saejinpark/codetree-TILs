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
    guard temp.count == 2, let num = Int(temp[0]) else { return nil }
    return (num, String(temp[1])) 
}

func solution(input: (Int, [(Int, String)])) -> String {
    let (n, commands) = input
    var dict: [String: [Int]] = [:]

    var current = 0
    var start = 0
    var end = 0
    
    for command in commands {
        let (num, d) = command
        switch d {
        case "L":
            for _ in (1...num) {
                dict["\(current - 1) \(current)", default: []].append(0)
                current -= 1
                start = current < start ? current : start 
            }
        case "R":
            for _ in (1...num) {
                dict["\(current) \(current + 1)", default: []].append(1)
                current += 1
                end = current > end ? current : end
            }
        default:
            return "-1"
        }
    }

    var answer = [0, 0, 0]

    for (key, value) in dict {
        var whiteCount = 0
        var blackCount = 0
        for i in value {
            if i == 0 {
                whiteCount += 1
            } else {
                blackCount += 1
            }

        }
        if whiteCount >= 2 && blackCount >= 2 {
            answer[2] += 1
        } else {
            answer[value[value.count - 1]] += 1
        }
    }

    return answer.map(String.init).joined(separator: " ")
}

func main() {
    guard let n = readNum() else { return }
    let commands = (1...n).compactMap({_ in readCommand()})
    print((n, commands) |> solution)
}

main()