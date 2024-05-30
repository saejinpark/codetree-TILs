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

func solution(input: (Int, Int, [Int], [(Int, Int)])) -> String {
    let (n, m, arr, ranges) = input
    var temp: [Int] = []
    for (start, end) in ranges {
        var sum = 0
        for i in start...end {
            sum += arr[i - 1]
        }
        temp.append(sum)
    }
    return temp.map(String.init).joined(separator: "\n")
}

func main() {
    guard let temp = readNums() else { return }
    if temp.count != 2 { return }
    let (n, m) = (temp[0], temp[1])
    guard let nums = readNums() else { return }
    if nums.count != n { return }
    let ranges = (1...m).compactMap({_ in readNums()}).map{($0[0], $0[1])}
    if ranges.count != m { return }
    print((n, m, nums, ranges) |> solution)
}

main()