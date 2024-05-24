import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}   

func solution(nums:[Int]) -> Int {
    if nums.count != 2 { return -1 }
    let (first, second) = (nums[0], nums[1])
    var current = first + second
    var cnt = 0
    while current != 0 {
        if current % 10 == 1 {
            cnt += 1
        }
        current /= 10
    }
    return cnt
}

func main() {
    guard let nums = readNums() else { return }
    print(nums |> solution)
}

main()