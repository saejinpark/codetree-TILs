import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let genNum = {
    var num = 1
    return {
        defer {
            num = num + 1
        }
        return String(num)
    }
}()

func input() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else {
        return nil
    }
    return num
}

func solution(_ n: Int) -> String {
    return (1...n).map{
        (1...$0)
            .map{_ in genNum()}
            .joined(separator: " ")
    }.joined(separator: "\n")
}

func main() {
    guard let n = input()
    else {
        return
    }
    print(solution(n))
}

main()