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

func readGrid(_ r:Int, _ c:Int) -> [[Int]]? {
    var grid:[[Int]] = []
    for _ in 1...r {
        if let nums = readNums(), nums.count == c{
            grid.append(nums)
        } else {
            return nil
        }
    }
    return grid
}

func solution(
    component:(Int, Int, [[Int]], [[Int]])
    ) -> [[Int]] {
        let (n, m, grid1, grid2) = component
        var answer = Array(
            repeating: 
                Array(repeating: 0, count: m),
            count: n
        )
        for i in 0..<n {
            for j in 0..<m {
                answer[i][j] = grid1[i][j] == grid2[i][j] ? 0 : 1
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
    if let temp = readNums(), temp.count == 2 {
        let (n, m) = temp |> {($0[0], $0[1])}
        if let grid1 = readGrid(n, m),
           let grid2 = readGrid(n, m) {
            let component = (n, m, grid1, grid2)
            print(component |> solution |> formatAnswer)
        }
    }
}

main()