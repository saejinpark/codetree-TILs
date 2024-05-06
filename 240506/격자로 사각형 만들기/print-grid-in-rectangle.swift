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

func solution(n:Int) -> [[Int]] {
    var answer = Array(
                    repeating: Array(repeating:0, count: n),
                    count: n
                )
    for i in 0..<n {
        answer[i][0] = 1
        answer[0][i] = 1
    }

    for i in 1..<n {
        for j in 1..<n {
            var sum = 0
            for (dr, dc) in [(-1, -1), (-1, 0), (0, -1)] {
                let (nr, nc) = (i + dr, j + dc)
                sum += answer[nr][nc]
            }
            answer[i][j] = sum
        }
    }

    return answer
}

func formatAnswer(answer:[[Int]]) -> String {
    return answer
            .map{
                $0.map{String($0)}.joined(separator: " ")
            }
            .joined(separator: "\n")
}

func main() {
    if let n = readNum() {
        print(n |> solution |> formatAnswer)
    }
}

main()