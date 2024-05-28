import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func sumPosNum(num: Int) -> Int {
    return String(num).split(separator: "").compactMap({Int($0)}).reduce(0, +)
}

var primeNumDict = [Int:Bool]()

for i in 1...100 {
    primeNumDict[i] = true

    if sumPosNum(num: i) % 2 != 0 {
        primeNumDict[i] = false
    }
}

primeNumDict[1] = false

for i in 2...100 {
    let end = 100 / i
    if end < 2 {
        continue
    }
    for j in 2...end {
        primeNumDict[i * j] = false
    }
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func solution(input: (Int, Int)) -> Int {
    let (start, end) = input
    return (start...end).filter{
        primeNumDict[$0, default: false]
    }.count
}

func main() {
    guard let input = readNums() else { return }
    if input.count != 2 { return }
    let (a, b) = (input[0], input[1])
    print((a, b) |> solution)
}

main()