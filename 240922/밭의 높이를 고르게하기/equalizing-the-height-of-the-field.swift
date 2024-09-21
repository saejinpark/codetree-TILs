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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count ? nums : nil
}

func readNHT() -> (Int, Int, Int)? {
    guard let nums = readNums(), nums.count == 3 else { return nil }
    return (nums[0], nums[1], nums[2])
}

func calculate(base: Int, num: Int) -> Int {
    return abs(num - base)
}

func solution(component: (Int, Int, Int, [Int])) -> Int {
    let (n, h, t, nums) = component
    var answer = Int.max
    for start in 0...(n - t) {
        var stack = nums[start..<(start + t)].map{calculate(base: h, num: $0) }.reduce(0, +) 
        answer = [answer, stack].min()!
    }
    return answer
}

func main() {
    guard let (n, h, t) = readNHT(),
    let nums = readNums(), nums.count == n
    else { return }
    print(solution(component: (n, h, t, nums)))
}

main()