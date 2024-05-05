import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

let genNumFunc = {
    var num = 1
    return {
        defer {
            num += 1
        }
        return num
    }
}

func solution(component:(Int, Int)) -> [[Int]] {
    let (n, m) = component
    let genNum = genNumFunc()
    var answer = Array(
                    repeating: Array(repeating: 0, count: m),
                    count: n
                )
    for i in 0..<(n + m) {
        var (r, c) = (-1, i + 1)
        while r < n {
            r += 1
            c -= 1
            if r >= n || c >= m || c < 0 {
                continue
            }
            answer[r][c] = genNum()
        }
    }
    return answer
}

func answerFormat(answer:[[Int]]) -> String {
    return answer
            .map{
                $0.map{String($0)}.joined(separator:" ")
            }
            .joined(separator:"\n")
}

func main() {
    if let temp = readNums() {
        let (n, m) = temp |> {($0[0], $0[1])}
        print((n, m) |> solution |> answerFormat)
    }
}

main()