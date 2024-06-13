import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias Move = (String, Int)

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readNAndM() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func readMove() -> Move? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let d = String(temp[0])
    guard ["R", "L"].contains(d), let num = Int(temp[1]) else { return nil }
    return (d, num)
}

func solution(input: (Int, Int, [Move], [Move])) -> Int {
    let (n, m, aMoves, bMoves) = input
    var current = 0
    func addCurrent() {
        current += 1
    }
    func decCurrent() {
        current -= 1
    }
    var aPosArr: [Int] = []
    var bPosArr: [Int] = []
    for (d, num) in aMoves {
        for _ in 1...num {
            d == "L" ?  decCurrent() : addCurrent()
            aPosArr.append(current)
        }
    }
    current = 0
    for (d, num) in bMoves {
        for _ in 1...num {
            d == "L" ?  decCurrent() : addCurrent()
            bPosArr.append(current)
        }
    }
    for i in 0..<aPosArr.count {
        if aPosArr[i] == bPosArr[i] {
            return i + 1
        }
    }
    return -1
}

func main() {
    guard let (n, m) = readNAndM() else { return }
    let aMoves = (1...n).compactMap({_ in readMove()})
    let bMoves = (1...m).compactMap({_ in readMove()})
    print((n, m, aMoves, bMoves) |> solution)
}

main()