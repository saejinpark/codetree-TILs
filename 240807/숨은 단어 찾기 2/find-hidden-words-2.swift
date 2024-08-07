import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func readNAndM() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func readGrid(n: Int, m: Int) -> [[String]]? {
    let grid = (1...n).compactMap({ _ in
        if let line = readLine() {
            return line.count == m ? line.split(separator: "").map(String.init) : nil
        }
        return nil
    })
    return grid.count == n ? grid : nil
}

let dList = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (-1, -1), (1, -1), (-1, 1)]

func genStartEnd(coord: (Int, Int), d:(Int, Int), limit: (Int, Int)) -> [(Int, Int)]? {
    if coord.0 - d.0 < 0 || limit.0 <= coord.0 + d.0
    || coord.1 - d.1 < 0 || limit.1 <= coord.1 + d.1
    || coord.0 + d.0 < 0 || limit.0 <= coord.0 - d.0
    || coord.1 + d.1 < 0 || limit.1 <= coord.1 - d.1 {
        return nil
    }
    return [
        (coord.0 - d.0, coord.1 - d.1),
        coord,
        (coord.0 + d.0, coord.1 + d.1)
    ]
}

func solution(component: (Int, Int, [[String]])) -> Int {
    let (n, m, grid) = component

    var answer = 0
    for row in 0..<n {
        for col in 0..<m {
            for d in dList {
                if let coords = genStartEnd(coord: (row, col), d: d, limit: (n, m)) {
                    var text = ""
                    for (r, c) in coords {
                        text += grid[r][c]
                    }
                    if text == "LEE" {
                        answer += 1
                    }
                }                 
            }
        }
    }

    return answer
}

func main() {
    guard let (n, m) = readNAndM(), let grid = readGrid(n:n, m:m) else { return }
    print((n, m, grid) |> solution)
}

main()