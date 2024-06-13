import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readNMK() -> (Int, Int, Int)? {
    guard let nums = readNums(), nums.count == 3 else { return nil }
    return (nums[0], nums[1], nums[2])
}

func solution(input: (Int, Int, Int, [Int])) -> Int {
    let (N, M, K, penaltys) = input
    var students = Array(repeating: 0, count: N)
    for penalty in penaltys {
        let current = penalty - 1
        students[current] += 1
        if students[current] == K {
            return current + 1
        }
    }
    return -1
}

func main() {
    guard let (N, M, K) = readNMK() else { return }
    let penaltys = (1...M).compactMap({_ in readNum()})
    print((N, M, K, penaltys) |> solution)
}

main()