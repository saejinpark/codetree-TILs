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

var frimeNumDict: [Int: Bool] = [:]

for i in 2...100 {
    frimeNumDict[i] = true
}

for i in 2...100 {
    let bool = frimeNumDict[i]!
    if !bool { continue }
    for j in stride(from: 2, to: (100 / i) + 1, by: 1) {
        frimeNumDict[i * j] = false
    }
}

func solution(input: (Int, Int)) -> Int {
    let (a, b) = input
    return (a...b).filter{frimeNumDict[$0]!}.reduce(0, +)
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (a, b) = (nums[0], nums[1])
    print((a, b) |> solution)
}

main()