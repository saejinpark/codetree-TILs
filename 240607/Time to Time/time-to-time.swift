import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readABCD() -> (Int, Int, Int, Int)? {
    guard let line = readLine() else {return nil}
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if nums.count != 4 && temp.count != nums.count { return nil }
    return (nums[0], nums[1], nums[2], nums[3])
}

func solution(component: (Int, Int, Int, Int)) -> Int {
    let (a, b, c, d) = component
    return (c - a) * 60 + (d - b)
}

func main() {
    guard let input = readABCD() else { return }
    print(input |> solution)
}

main()