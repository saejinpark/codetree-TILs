import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readBrackets() -> [String]? {
    guard let line = readLine() else { return nil }
    return line.split(separator: "").compactMap(String.init)
}

func solution(brackets: [String]) -> Int {
    let limit = brackets.count - 1
    var stack = 0

    for i in 0...(limit - 1) {

        if brackets[i] != "(" {
            continue
        }
        for j in (i + 1)...limit {
            if brackets[j] == ")" {
                stack += 1
            }
        }
    }

    return stack
}

func main() {
    guard let brackets = readBrackets()
    else { return }
    print(brackets |> solution)

}

main()