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

func genNumFunc() -> () -> Int {
    var num = 1
    return {
        defer {
            num += 1
        }
        return num
    }    
} 

func solution(n:Int) -> [[Int]] {
    var answer = Array(
                repeating: Array(repeating: 0, count: n),
                count: n
                )
    let genNum = genNumFunc()
    var cnt = -1
    for c in stride(from: n - 1, to: -1, by: -1) {
        cnt += 1
        if cnt % 2 == 0 {
            for r in stride(from: n - 1, to: -1, by: -1) {
                answer[r][c] = genNum()
            }
            continue
        }
        for r in 0..<n {
            answer[r][c] = genNum()
        }
    }
    return answer
}

func answerFormat(answer:[[Int]]) -> String {
    return answer.map{$0.map{String($0)}.joined(separator:" ")}.joined(separator:"\n")
}

func main() {
    if let n = readNum() {
        print(n |> solution |> answerFormat)
    }
}

main()