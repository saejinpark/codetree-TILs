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

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(input: (Int, Int, [(Int, Int)], [(Int, Int)])) -> Int {
    let (N, M, aPairs, bPairs) = input
    var aPosLog: [Int] = [0]
    var bPosLog: [Int] = [0]
    for (v, t) in aPairs {
        for _ in 1...t {
            aPosLog.append(aPosLog[aPosLog.count - 1] + v)
        }
    }
    for (v, t) in bPairs {
        for _ in 1...t {
            bPosLog.append(bPosLog[bPosLog.count - 1] + v)
        }
    }
    var count = 0
    var current = 0
    var headList: [Int] = []
    
    for i in 1..<(N + M) {
        if aPosLog[i] > bPosLog[i] {
            headList.append(1)
        }
        if aPosLog[i] < bPosLog[i] {
            headList.append(2)
        }
    }

    for head in headList {
        if current != head {
            current = head
            count += 1
        }
    }

    return count
}

func main() {
    guard let (n, m) = readNumPair() else { return }
    let aPairs = (1...n).compactMap({_ in readNumPair()})
    let bPairs = (1...n).compactMap({_ in readNumPair()})
    print((n, m, aPairs, bPairs) |> solution)
}

main()