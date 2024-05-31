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

func solution(cur: Int = 0, num: Int) -> Int {
    if num == 0 {
        return cur
    }
    let remain = num % 10

    return solution(cur: cur + remain * remain, num: num / 10)
} 

func main() {
    guard let num = readNum() else { return }
    print(solution(num: num))
}

main()