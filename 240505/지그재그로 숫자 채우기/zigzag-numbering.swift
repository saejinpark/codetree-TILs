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
    let nums = temp.compactMap{Int($0)}
    return temp.count == nums.count ? nums : nil
}

func genNumFunc() -> () -> Int {
    var num = 0
    return {
        defer {
            num += 1
        }
        return num
    }
}

func solution(_ r:Int, _ c:Int) -> [[Int]] {
    var answer = Array(
                    repeating: Array(repeating: 0, count: c),
                    count: r
                    )
    let genNum = genNumFunc()

    for j in 0..<c {
        if j % 2 == 0 {
            for i in 0..<r {
                answer[i][j] = genNum()
            }
            continue
        }   
        for i in stride(from: r - 1, to: -1, by: -1) {
            answer[i][j] = genNum()
        }
    }

    return answer
}

func answerFormat(answer:[[Int]]) -> String {
    return answer
                .map{
                    $0.map{String($0)}.joined(separator: " ")
                }
                .joined(separator: "\n")

}

func main() {
    if let temp = readNums(), temp.count == 2 {
        let (r, c) = temp |> {($0[0], $0[1])}
        print(solution(r, c) |> answerFormat)
    }
}

main()