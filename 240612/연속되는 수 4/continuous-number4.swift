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

func solution(nums: [Int]) -> Int {
    var maxLength = 1
    var length = 0
    var temp = -1
    for num in nums {
        if temp == -1 || num <= temp {
            temp = num
            length = 1
            continue
        }
        temp = num
        length += 1
        maxLength = length > maxLength ? length : maxLength
    }
    return maxLength
}

func main() {
    guard let n = readNum() else { return }
    let nums = (1...n).compactMap({_ in readNum()})
    if n != nums.count { return }
    print(nums |> solution) 
}

main()