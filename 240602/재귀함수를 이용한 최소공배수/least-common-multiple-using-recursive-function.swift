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

func gcd(w: Int, h: Int) -> Int {
    if h > w { return gcd(w: h, h: w) }
    if w % h == 0 { return h }
    return gcd(w: h, h: w % h)
}

func lcm(num1: Int, num2: Int) -> Int {
    return num1 * num2 / gcd(w: num1, h: num2)
}

func solution(n: Int, nums: [Int]) -> Int {
    return nums.reduce(1){lcm(num1: $0, num2: $1)}
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if nums.count != n { return }
    print(solution(n: n, nums: nums))
}

main()