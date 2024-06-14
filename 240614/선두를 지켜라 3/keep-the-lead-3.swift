import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias NumPair = (Int, Int)

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readNumPair() -> NumPair? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func move(posArr: inout [Int], move: NumPair) {
    let (v, t) = move
    for _ in (1...t) {
        posArr.append(posArr[posArr.count - 1] + v)
    }
}

func solution(input: (Int, Int, [NumPair], [NumPair])) -> Int {
    let (n, m, aMoves, bMoves) = input
    var aPosArr = [0]
    var bPosArr = [0]
    for aMove in aMoves {
        move(posArr: &aPosArr, move: aMove)
    }
    for bMove in bMoves {
        move(posArr: &bPosArr, move: bMove)
    }
    aPosArr.remove(at: 0)
    bPosArr.remove(at: 0)
    
    var temp = -1
    var count = 0
    for i in 0..<aPosArr.count {
        let testCase = aPosArr[i] > bPosArr[i]
            ? 0
            : aPosArr[i] < bPosArr[i]
            ? 1
            : 2
        if temp != testCase {
            temp = testCase
            count += 1
        }
    }
    return count
}

func main() {
    guard let (n, m) = readNumPair() else { return }
    let aMoves = (1...n).compactMap({_ in readNumPair()})
    let bMoves = (1...m).compactMap({_ in readNumPair()})
    if aMoves.count != n || bMoves.count != m { return }
    
    print((n, m, aMoves, bMoves) |> solution)
}

main()