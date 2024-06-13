import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias Move = (Int, String)

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
    if temp.count != 2 { return nil }
    let d = String(temp[1])
    guard let num = Int(temp[0]),
    ["L", "R"].contains(d)
    else { return nil }
    return (num, d)
}

func solution(input: (Int, Int, [Move], [Move])) -> Int {
    let (n, m, aMoves, bMoves) = input
    var current = 0
    var aPosArr = [0]
    var bPosArr = [0]
    for (num, d) in aMoves {
        switch d {
        case "L":
            for _ in 1...num {
                current -= 1
                aPosArr.append(current)
            }
        case "R":
            for _ in 1...num {
                current += 1
                aPosArr.append(current)
            }
        default:
            return -1
        }
    }

    current = 0

    for (num, d) in bMoves {
        switch d {
        case "L":
            for _ in 1...num {
                current -= 1
                bPosArr.append(current)
            }
        case "R":
            for _ in 1...num {
                current += 1
                bPosArr.append(current)
            }
        default:
            return -1
        }
    }

    var count = 0

    if aPosArr.count < bPosArr.count {
        while(aPosArr.count < bPosArr.count) {
            aPosArr.append(aPosArr[aPosArr.count - 1])
        }
    }
    if bPosArr.count < aPosArr.count {
        while(bPosArr.count < aPosArr.count) {
            bPosArr.append(bPosArr[bPosArr.count - 1])
        }
    }

    for i in 1..<aPosArr.count {
        if aPosArr[i - 1] != bPosArr[i - 1]
        && aPosArr[i] == bPosArr[i] {
            count += 1
        } 
    }

    return count
}

func main() {
    guard let (n, m) = readNAndM() else { return }
    let aMoves = (1...n).compactMap({_ in readMove()})
    let bMoves = (1...m).compactMap({_ in readMove()})
    if aMoves.count != n && bMoves.count != m {
        return
    }
    print((n, m, aMoves, bMoves) |> solution)
}

main()