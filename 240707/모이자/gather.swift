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
    return temp.count == nums.count ? nums : nil
}

func solution(component: (Int, [Int])) -> Int {
    let (n, nums) = component
    var minStack = Int.max

    for i in 0..<n {
        var stack = 0

        for j in stride(from: i - 1, to: -1, by: -1) {
            stack += nums[j] * (i - j)
        } 

        for j in  (i + 1)..<n {
            stack += nums[j] * (j - i)
        }
        
        minStack = stack < minStack ? stack : minStack
    }
    
    return minStack
}

func main() {
    guard let n = readNum(),
    let nums = readNums(),
    n == nums.count
    else { return }

    print((n, nums) |> solution)
}

main()