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
    guard let nums = readNums(), nums.count == 2 else { return nil}
    return (nums[0], nums[1])
}

func solution(component: (Int, Int, [(Int, Int)], Int)) -> Int {
    var answer = 0

    let (n, k, coords, l) = component
    var row = Array(repeating: 0, count: l + 1)
    for (count, index) in coords {
        row[index] += count
    }
    for c in k..<(l - k) {
        var testCase = 0
        for index in (c - k)...(c + k) {
            testCase += row[index]
        }
        answer = testCase > answer ? testCase : answer
    }

    return answer
}

func main() {
    guard let (n, k) = readNumPair() else { return }
    var coords = [(Int, Int)]()
    var l = 0
    for _ in 1...n {
        guard let coord = readNumPair() else { return }
        coords.append(coord)
        l = coord.1 > l ? coord.1 : l
    }
    print((n, k, coords, l) |> solution)
}

main()