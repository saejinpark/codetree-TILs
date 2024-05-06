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
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(component:(Int, [(Int, Int)])) -> [[Int]] {
    let (n, coords) = component
    var answer = Array(
                    repeating: Array(repeating: 0, count: n),
                    count: n
                    )
    for (r, c) in coords {
        answer[r][c] = (r + 1) * (c + 1)
    }
    return answer
}

func formatAnswer(answer:[[Int]]) -> String {
    return answer
                .map{
                    $0.map{
                        String($0)
                    }
                    .joined(separator: " ")
                }
                .joined(separator: "\n")
}

func main() {
    if let temp = readNums(), temp.count == 2 {
        let (n, m) = temp |> {($0[0], $0[1])}
        let coords = (1...m).compactMap({_ in
            if let nums = readNums(), nums.count == 2 {
                return (nums[0] - 1, nums[1] - 1)
            }
            return nil
        })
        print((n, coords) |> solution |> formatAnswer)
    }
}

main()