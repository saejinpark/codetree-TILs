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
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2
    else { return nil }
    return (nums[0], nums[1])
}

func solution(component: (Int, Int, [[String]])) -> Int {
    let (r, c, grid) = component
    var count = 0

    for i in 1..<(r - 2) {
        for j in 1..<(c - 2) {
            if grid[i][j] == grid[0][0] {
                continue
            }

            for k in (i + 1)..<(r - 1) {
                for u in (j + 1)..<(c - 1) {
                    if grid[k][u] == grid[r - 1][ c - 1] {
                        continue
                    }
                    count += 1                 
                }
            }
        }
    }

    return count
}

func main() {
    guard let (r, c) = readNumPair() else { return }
    var grid: [[String]] = []
    for _ in 1...r {
        guard let line = readLine() else { return }
        let row = line.split(separator: " ").map(String.init)
        if row.count != c {
            return
        }
        grid.append(row)
    }

    print((r, c, grid) |> solution)
}

main()