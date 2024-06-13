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
    var aPosLog = [0]
    var bPosLog = [0]

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
    aPosLog.remove(at: 0)
    bPosLog.remove(at: 0)

    var current = aPosLog[0] > bPosLog[0] ? 1 : 2
    var count = 0
    
    for i in 1..<[aPosLog.count, bPosLog.count].min()! {
        if aPosLog[i] == bPosLog[i] {
            continue
        }
        if aPosLog[i] > bPosLog[i] && current != 1 {
            current = 1
            count += 1
        }
        if aPosLog[i] < bPosLog[i] && current != 2 {
            current = 2
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