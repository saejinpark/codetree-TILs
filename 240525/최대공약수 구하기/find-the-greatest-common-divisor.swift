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

func gcd(_ w: Int, _ h: Int) -> Int {
    if h > w { return gcd(h, w) }
    if w % h == 0 { return h }
    return gcd(h, w % h)
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (n, m) = (nums[0], nums[1])
    print(gcd(n, m))
}

main()