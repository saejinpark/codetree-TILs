import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readCoordPair() -> ((Int, Int), (Int, Int))? {
    guard let nums = readNums() else { return nil }
    if nums.count != 4 { return nil }
    return ((nums[0], nums[1]), (nums[2], nums[3]))
}

func solution(coordPairs: [((Int, Int), (Int, Int))]) -> Int{
    let offset = 100
    var grid = Array(
                repeating: Array(repeating: 0, count: offset * 2 + 1),
                count: offset * 2 + 1)
    for coordPair in coordPairs {
        let (start, end) = coordPair
        let (sx, sy) = start
        let (ex, ey) = end
        for y in sy..<ey {
            for x in sx..<ex {
                grid[y + offset][x + offset] = 1
            }
        }
    }
    var area = 0
    for col in grid {
        for i in col {
            if i == 1 {
                area += 1
            }
        }
    }

    return area
}

func main() {
    guard let n = readNum() else { return }
    let coordPairs = (1...n).compactMap({_ in readCoordPair()})
    if coordPairs.count != n { return }
    print(coordPairs |> solution)
}

main()