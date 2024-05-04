import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func lineToNums(line:String) -> [Int]? {
    let temp = line.split(separator:" ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func strToGrid(str:String) -> [[Int]]? {
    let lines = str.split(separator: "\n").map{String($0)}
    var grid:[[Int]] = []
    for line in lines {
        guard let nums = line |> lineToNums else { return nil }
        grid.append(nums)
    }
    return grid
}

func readInput() -> [[[Int]]]? {
    var lines:[String] = []
    for _ in 1...7 {
        guard let line = readLine() else { return nil }
        lines.append(line)
    }
    let input = lines.joined(separator: "\n")
    let temp = input.split(separator: "\n\n").map{String($0)}
    let grids = temp.compactMap{$0 |> strToGrid}
    return temp.count == grids.count ? grids : nil
}

func solution(component:([[Int]], [[Int]])) -> [[Int]] {
    let (grid1, grid2) = component
    var answer = Array(
                    repeating:Array(repeating: 0, count: 3),
                    count: 3
                )
    for i in 0..<3 {
        for j in 0..<3 {
            answer[i][j] = grid1[i][j] * grid2[i][j]
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
    if let grids = readInput(), grids.count == 2 {
        let (grid1, grid2) = grids |> {($0[0], $0[1])}
        print((grid1, grid2) |> solution |> formatAnswer)
    }
}

main()