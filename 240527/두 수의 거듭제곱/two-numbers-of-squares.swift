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

func solution(component: (Int, Int)) -> Int {
    let (num, count) = component
    return Array(repeating: num, count: count).reduce(1, *)
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (num, count) = (nums[0], nums[1])
    print((num, count) |> solution) 
}

main()