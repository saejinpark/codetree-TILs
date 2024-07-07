import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine()
    else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2
    else { return nil }
    return (nums[0], nums[1])
}

func readGrid(n: Int) -> [[Int]]? {
    var grid: [[Int]] = []
    
    for _ in 0..<n {
        guard let nums = readNums(), nums.count == n else { return nil }
        grid.append(nums)
    }

    return grid
}

let dl = [
    (-1, 0),
    (0, 1),
    (1, 0),
    (0, -1)
]

func solution(component: (Int, Int, String, [[Int]])) -> Int {
    let (n, _, command, grid) = component
    let mid = n / 2
    var dindex = 0
    var current = (mid, mid)
    var stack = grid[mid][mid]

    for i in command.split(separator: "").map(String.init) {
        switch i {
        case "R":
            dindex = (dindex + 1) % dl.count
            continue
        case "L":
            dindex = (dindex + 3) % dl.count
            continue
        case "F":
            let (r, c) = current
            let (dr, dc) = dl[dindex]
            let (nr, nc) = (r + dr, c + dc)
            if nr < 0 || n <= nr || nc < 0 || n <= nc {
                continue
            }
            stack += grid[nr][nc]
            current = (nr, nc)
        default:
            return -1
        }
    }

    return stack
}

func main() {
    guard let (n, t) = readNumPair(),
    let command = readLine(),
    let grid = n |> readGrid
    else { return }
    print((n, t, command, grid) |> solution)
}

main()