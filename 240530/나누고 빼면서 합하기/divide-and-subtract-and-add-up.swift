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

func solution(input: (Int, Int, [Int])) -> Int {
    let (n, m, a) = input
    var sum = a[m - 1]
    var current = m
    while current != 1 {
        current = current % 2 == 0 ? current / 2 : current - 1
        sum += a[current - 1]
    }
    return sum
}

func main() {
    guard let nm = readNums() else { return }
    if nm.count != 2 { return }
    let (n, m) = (nm[0], nm[1])
    guard let a = readNums() else { return }
    print((n, m, a) |> solution)
}

main()