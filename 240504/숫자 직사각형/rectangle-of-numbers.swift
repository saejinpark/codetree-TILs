import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}


func readInput() -> (Int, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if nums.count != 2 { return nil }
    return (nums[0], nums[1])
}

let genNum = {
    var num = 1
    return {
        defer { num += 1 }
        return num
    }
}()

func solution(component:(Int, Int)) -> [[Int]] {
    let (n, m) = component
    var grid:[[Int]] = []

    for _ in 1...n {
        var row:[Int] = []
        for _ in 1...m {
            row.append(genNum())
        }
        grid.append(row)
    }

    return grid
}

func formatValue(grid:[[Int]]) -> String {
    return grid.map{
        $0.map{String($0)}.joined(separator: " ")
    } .joined(separator: "\n")
}

func main() {
    if let temp = readInput() {
        let (n, m) = temp
        print((n, m) |> solution |> formatValue)
    }
}

main()