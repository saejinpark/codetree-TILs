import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(bracketStr: String) -> Int {
    let brackets = bracketStr.split(separator: "").map(String.init)
    var count = 0

    for i in stride(from: 0, to: brackets.count - 2, by: 1) {
        if brackets[i] != "(" || brackets[i + 1] != "(" {
            continue
        }
        for j in stride(from: i + 2, to: brackets.count - 1, by: 1) {
            if brackets[j] != ")" || brackets[j + 1] != ")" {
                continue
            }
            count += 1
        }
    }

    return count
}

func main() {
    guard let line = readLine() else { return }
    print(line |> solution)
}

main()