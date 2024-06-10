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
    
    var offset = 0
    for (num, _) in commands {
        offset += num
    }
    var arr: [[Int]] = Array(repeating: [], count: offset * 2 + 1)
    var current = offset

    for (num, d) in commands {
        switch d {
        case "L":
            arr[current].append(0)
            for _ in 1..<num {
                current -= 1
                arr[current].append(0)
            }
        case "R":
            arr[current].append(1)
            for _ in 1..<num {
                current += 1
                arr[current].append(1)
            }
        default:
            return "-1"
        }
    }

    var answer = [0, 0, 0]

    for colors in arr {
        if colors.count == 0 {
            continue
        }
        var whiteCount = 0
        var blackCount = 0 
        
        for color in colors {
            if color == 0 {
                whiteCount += 1
            }else {
                blackCount += 1
            }
        }
        if whiteCount >= 2 && blackCount >= 2 {
            answer[2] += 1
        } else {
            answer[colors[colors.count - 1]] += 1
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