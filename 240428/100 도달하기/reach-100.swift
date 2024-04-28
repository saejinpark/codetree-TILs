import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U{
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(_ num:Int) -> String {
    var nums = [1, num]
    while nums.last! < 100 {
        let nextIndex = nums.count
        nums.append(nums[nextIndex - 2] + nums[nextIndex - 1])
    }
    return nums.map{ String($0) }.joined(separator: " ")
}

func main() {
    if let num = readNum() {
        print(solution(num))
    }
}

main()