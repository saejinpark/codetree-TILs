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

func solution(year: Int) -> Bool {
    if year % 4 != 0 { return false }
    if year % 100 == 0 && year % 400 != 0 {return false}
    return true
}

func main() {
    guard let year = readNum() else { return }
    print(year |> solution)
}

main()