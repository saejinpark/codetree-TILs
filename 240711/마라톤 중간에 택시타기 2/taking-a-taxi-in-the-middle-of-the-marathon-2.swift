import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else { return nil }

    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

struct Coord: Hashable {
    var row: Int
    var col: Int

    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }

    func getValue() -> (Int, Int) {
        return (row, col)
    }
}

func calculateDistance(c1: Coord, c2: Coord) -> Int {
    let (x1, y1) = c1.getValue()
    let (x2, y2) = c2.getValue()
    return abs(x1 - x2) + abs(y1 - y2)
}

func checkPointsDistance(checkPoints: [Coord]) -> Int {
    var stack = 0
    for i in 0..<(checkPoints.count - 1) {
        stack += calculateDistance(c1: checkPoints[i], c2:  checkPoints[i + 1])
    }
    return stack
}

func solution(component: (Int, [Coord])) -> Int {
    let (n, checkPoints) = component

    var answer = Int.max

    for i in 1..<(n - 1) {
        let filteredCheckPoints = checkPoints.enumerated().filter{(index, point) in i != index}.map{(_, point) in point}
        let distance = checkPointsDistance(checkPoints: filteredCheckPoints)
        answer = distance < answer ? distance : answer
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    var checkPoints: [Coord] = []

    for _ in 1...n {
        guard let (row, col) = readNumPair() else { return }

        checkPoints.append(Coord(row: row, col: col))
    }

    print((n, checkPoints) |> solution)

}

main()