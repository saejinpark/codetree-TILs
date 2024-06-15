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
    if temp.count != nums.count { return nil }
    return nums
}

func readNT() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func readRCD() -> (Int, Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 3,
    let r = Int(temp[0]),
    let c = Int(temp[1])
    else { return nil }
    return (r, c, String(temp[2]))
}

let dDict = [
    "U": (-1, 0),
    "D": (1, 0),
    "L": (0, -1),
    "R": (0, 1)
]

let oppositeDict = [
    "U": "D",
    "D": "U",
    "L": "R",
    "R": "L",
]

func solution(input: (Int, Int, Int, Int, String)) -> String {
    let (n, t, r, c, d) = input
    var current = (r - 1, c - 1)
    var currentD = d
    for _ in 1...t{
        guard let (dRow, dCol) = dDict[currentD] else { return "" }
        let (nRow, nCol) = (current.0 + dRow, current.1 + dCol)
        if nRow < 0 || n <= nRow || nCol < 0 || n <= nCol {
            guard let nd = oppositeDict[currentD] else { return "" }
            currentD = nd
            continue
        }
        current = (nRow, nCol)
    }

    return "\(current.0 + 1) \(current.1 + 1)"
}

func main() {
    guard let (n, t) = readNT(),
    let (r, c, d) = readRCD()
    else { return }
    print((n, t, r, c, d) |> solution)
}

main()