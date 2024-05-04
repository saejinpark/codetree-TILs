import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) 
    else { return nil }
    return num
}

func solution(_ n:Int) -> [[Int]] {
    let genNum = {
        var num = 1
        return {
            defer {
                num += 1
            }
            return num
        }
    }()

    var answer = Array(
                    repeating: Array(repeating: 0, count:n),
                    count: n
                    )
    for c in 0..<n {
        for r in 0..<n {
            answer[r][c] = genNum() 
        }
    }
    return answer
}

func formatAnswer(answer:[[Int]]) -> String {
    return answer
            .map{$0.map{String($0)}.joined(separator: " ")}
            .joined(separator: "\n")
}

func main() {
    if let n = readNum() {
        print(n |> solution |> formatAnswer)
    }
}

main()