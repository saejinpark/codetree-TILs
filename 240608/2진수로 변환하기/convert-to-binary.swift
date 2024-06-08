import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(),
    let num = Int(line)
    else { return nil}
    return num
}

func solution(num: Int) -> String {
    return String(num, radix: 2)
}

func main() {
    guard let num = readNum() else { return }
    print(String(num, radix: 2))
}

main()